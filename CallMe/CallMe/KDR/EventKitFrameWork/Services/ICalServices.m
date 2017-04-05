//
//  ICalServices.m
//  CallMe
//
//  Created by Kian Davoudi-Rad on 2017-04-03.
//  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>
#import "ICalServices.h"

@implementation ICalServices : NSObject 

#pragma mark -
#pragma mark View lifecycle
// Entry
- (void)loadCalanderServices {

    // Initialize the event store
    self.eventStore = [[EKEventStore alloc] init];
    // Initialize the events list
    self.eventsList = [[NSMutableArray alloc] initWithCapacity:0];

    // Check whether we are authorized to access Calendar
    [self checkEventStoreAccessForCalendar];
}

// This method is called when the user selects an event in the table view. It configures the destination
// event view controller with this event.

#pragma mark Access Calendar

// Check the authorization status of our application for Calendar
-(void)checkEventStoreAccessForCalendar {
    EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent];

    switch (status)
    {
            // Update our UI if the user has granted access to their Calendar
        case EKAuthorizationStatusAuthorized:
            [self accessGrantedForCalendar];
            break;
            // Prompt the user for access to Calendar if there is no definitive answer
        case EKAuthorizationStatusNotDetermined:
//            [self requestCalendarAccess];
            break;
            // Display a message if the user has denied or restricted access to Calendar
        case EKAuthorizationStatusDenied:

        case EKAuthorizationStatusRestricted:
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Privacy Warning" message:@"Permission was not granted for Calendar"
                                                                    preferredStyle:UIAlertControllerStyleAlert];

            UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK"
                                                                    style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            [alert addAction:defaultAction];

        }
            break;
        default:
            break;
    }
}


// Prompt the user for access to their Calendar
-(void)requestCalendarAccess {

    [self.eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error)

     {
         if (granted)
         {
             ICalServices * __weak weakSelf = self;
             // Let's ensure that our code will be executed from the main queue
             dispatch_async(dispatch_get_main_queue(), ^{
                 // The user has granted access to their Calendar; let's populate our UI with all events occuring in the next 24 hours.
                 [weakSelf accessGrantedForCalendar];
             });
         }
         else {

             NSLog(@"This is the status%@",granted);
         }
     }];


    //Request the access to the Calendar
    [_eventStore requestAccessToEntityType:EKEntityTypeEvent
                               completion:^(BOOL granted,NSError* error){
                                   //Access not granted-------------
                                   if(!granted){

                                       ICalServices * __weak weakSelf = self;
                                                    // Let's ensure that our code will be executed from the main queue
                                                    dispatch_async(dispatch_get_main_queue(), ^{
                                                        // The user has granted access to their Calendar; let's populate our UI with all events occuring in the next 24 hours.
                                                        [weakSelf accessGrantedForCalendar];

                                                    });
                                   }
                                   
                                   //Access granted------------------


     }];


    // save to iphone calendar
   }



// This method is called when the user has granted permission to Calendar
-(void)accessGrantedForCalendar {
    // Let's get the default calendar associated with our event store
    self.defaultCalendar = self.eventStore.defaultCalendarForNewEvents;
    // Enable the Add button
    //    self.addButton.enabled = YES;
    // Fetch all events happening in the next 24 hours and put them into eventsList
//    self.eventsList = [self fetchEvents];
    // Update the UI with the above events
    //    [self.tableView reloadData];
}


#pragma mark Fetch events

// Fetch all events happening in the next 24 hours
- (NSMutableArray *)fetchEvents {
//    NSDate *startDate = [NSDate date];
//
//    //Create the end date components
//    NSDateComponents *tomorrowDateComponents = [[NSDateComponents alloc] init];
//    tomorrowDateComponents.day = 1;
//
//    NSDate *endDate = [[NSCalendar currentCalendar] dateByAddingComponents:tomorrowDateComponents
//                                                                    toDate:startDate
//                                                                   options:0];
//    // We will only search the default calendar for our events
//    NSArray *calendarArray = @[self.defaultCalendar];
//
//    // Create the predicate
//    NSPredicate *predicate = [self.eventStore predicateForEventsWithStartDate:startDate
//                                                                      endDate:endDate
//                                                                    calendars:calendarArray];
//
//    // Fetch all events that match the predicate
//    NSMutableArray *events = [NSMutableArray arrayWithArray:[self.eventStore eventsMatchingPredicate:predicate]];


    EKEventStore *eventStore = [[EKEventStore alloc] init];
    if([eventStore respondsToSelector:@selector(requestAccessToEntityType:completion:)])
    {
        // iOS 6 and later
        // This line asks user's permission to access his calendar
//        [eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error)
//         {
//             if (!granted) // user user is ok with it
             {

                     // We will only search the default calendar for our events
                     NSArray *calendarArray = @[self.defaultCalendar];
                 
                     // Create the predicate
                     NSPredicate *predicate = [self.eventStore predicateForEventsWithStartDate:[NSDate date]
                                                                                       endDate:[NSDate date]
                                                                                     calendars:calendarArray];

                 NSArray *t = [eventStore eventsMatchingPredicate:predicate];
                 EKEvent *titleTest = t.firstObject;
                 NSString *title = titleTest.title;
//                 if(err)
//                     NSLog(@"unable to save event to the calendar!: Error= %@", err);






                 EKEvent *event = [EKEvent eventWithEventStore:eventStore];
                 event.title  = @"CAllmeSaysHello";
                 event.allDay = YES;

                 //                 NSDateFormatter *dateFormat = [[UIApplicationSingleton sharedManager] aDateFormatter];
                 //                 [dateFormat setDateFormat:@"MMM dd, yyyy hh:mm aaa"];


                 ////                 NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:now];
                 //                 [components setHour:10];
                 //                 NSDate *today10am = [calendar dateFromComponents:components];

                 event.startDate = [NSDate date];

                 event.endDate = [NSDate date];//put here if start and end dates are same

                 [event setCalendar:[eventStore defaultCalendarForNewEvents]];
                 NSError *err;
                 
                 [eventStore saveEvent:event span:EKSpanThisEvent error:&err];



//             }
//             else // if he does not allow
//             {
//                 [[[UIAlertView alloc]initWithTitle:nil message:@"issueKDR" delegate:nil cancelButtonTitle:NSLocalizedString(@"Pulled data from Calendar", nil)  otherButtonTitles: nil] show];
//
                 [[[UIAlertView alloc]initWithTitle:nil message:title delegate:nil cancelButtonTitle:NSLocalizedString(@"Pulled data from Calendar", nil)  otherButtonTitles: nil] show];
                 //               return;
//             }
//         }];
    }
    }

    return eventStore;
}


-(void) saveEvent:(EKEvent*) event
{

}

#pragma mark Add a new event

// Display an event edit view controller when the user taps the "+" button.
// A new event is added to Calendar when the user taps the "Done" button in the above view controller.
- (IBAction)addEvent:(id)sender {
    // Create an instance of EKEventEditViewController
    EKEventEditViewController *addController = [[EKEventEditViewController alloc] init];

    // Set addController's event store to the current event store
    addController.eventStore = self.eventStore;
    addController.editViewDelegate = self;
    //    [self presentViewController:addController animated:YES completion:nil];
}

#pragma mark EKEventEditViewDelegate

// Overriding EKEventEditViewDelegate method to update event store according to user actions.
- (void)eventEditViewController:(EKEventEditViewController *)controller didCompleteWithAction:(EKEventEditViewAction)action {
    ICalServices * __weak weakSelf = self;
    // Dismiss the modal view controller
    //    [self dismissViewControllerAnimated:YES completion:^
    {
        if (action != EKEventEditViewActionCanceled)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                // Re-fetch all events happening in the next 24 hours
                weakSelf.eventsList = [self fetchEvents];
                //                  Update the UI with the above events
                //                 [weakSelf.tableView reloadData];
            });
        }
        //     }];
    }
}
@end
