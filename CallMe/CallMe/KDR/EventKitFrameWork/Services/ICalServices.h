//
//  ICalServices.h
//  CallMe
//
//  Created by Kian Davoudi-Rad on 2017-04-03.
//  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
//

#ifndef ICalServices_h
#define ICalServices_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>



@interface ICalServices: NSObject <EKEventEditViewDelegate>
// EKEventStore instance associated with the current Calendar application
@property (nonatomic, strong) EKEventStore *eventStore;

// Default calendar associated with the above event store
@property (nonatomic, strong) EKCalendar *defaultCalendar;

// Array of all events happening within the next 24 hours
@property (nonatomic, strong) NSMutableArray *eventsList;

// Public Functions
- (void) loadCalanderServices;
- (void) checkEventStoreAccessForCalendar;
- (NSMutableArray *)fetchEvents;

@end

#endif /* ICalServices_h */
