//
//  UIViewFrameOwekModel.h
//  CallMe
//
//  Created by Kian Davoudi-Rad on 2017-03-21.
//  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
//

#import<Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIViewFrameWorkModel : NSObject

// UIButton
@property (nonatomic,assign)  NSInteger* setTodatebuttonFrameOriginex;
@property (nonatomic,assign)  NSInteger* setTodatebuttonFrameOriginey;
@property (nonatomic,assign)  NSInteger* setTodatebuttonFrameSizeHeight;
@property (nonatomic,assign)  NSInteger* setTodatebuttonFrameSizeWidth;

// UITablePicker
@property (nonatomic,assign)  NSInteger* datePickerFrameOriginex;
@property (nonatomic,assign)  NSInteger* datePickerFrameOriginey;
@property (nonatomic,assign)  NSInteger* datePickerFrameSizeHeight;
@property (nonatomic,assign)  NSInteger* datePickerFrameSizeWidth;

// UITableView
@property (nonatomic,assign)  CGFloat uiTableViewFrameOriginex;
@property (nonatomic,assign)  CGFloat uiTableViewFrameOriginey;
@property (nonatomic,assign)  CGFloat uiTableViewFrameSizeHeight;
@property (nonatomic,assign)  CGFloat uiTableViewFrameSizeWidth;

// BrandHeader
@property (nonatomic,assign)  CGFloat uiBrandHeaderFrameOriginex;
@property (nonatomic,assign)  CGFloat uiBrandHeaderFrameOriginey;
@property (nonatomic,assign)  CGFloat uiBrandHeaderFrameSizeHeight;
@property (nonatomic,assign)  CGFloat uiBrandHeaderFrameSizeWidth;


// Brandicon
@property (nonatomic,assign)  CGFloat uiBrandIconFrameOriginex;
@property (nonatomic,assign)  CGFloat uiBrandIconFrameOriginey;
@property (nonatomic,assign)  CGFloat uiBrandIconFrameSizeHeight;
@property (nonatomic,assign)  CGFloat uiBrandIconFrameSizeWidth;

// DatePicker
@property (nonatomic,assign)  CGFloat uiDatePickerFrameOriginex;
@property (nonatomic,assign)  CGFloat uiDatePickerFrameOriginey;
@property (nonatomic,assign)  CGFloat uiDatePickerFrameSizeHeight;
@property (nonatomic,assign)  CGFloat uiDatePickerFrameSizeWidth;

// BrandFotter
@property (nonatomic,assign)  CGFloat uiFrameFooterFrameOriginex;
@property (nonatomic,assign)  CGFloat uiFrameFooterFrameOriginey;
@property (nonatomic,assign)  CGFloat uiFrameFooterFrameSizeHeight;
@property (nonatomic,assign)  CGFloat uiFrameFooterFrameSizeWidth;

//upcomingVisistsButton
@property (nonatomic,assign)  CGFloat uiUpcomingVisistsButtonFrameOriginex;
@property (nonatomic,assign)  CGFloat uiUpcomingVisistsButtonFrameOriginey;
@property (nonatomic,assign)  CGFloat uiUpcomingVisistsButtonFrameSizeWidth;
@property (nonatomic,assign)  CGFloat uiUpcomingVisistsButtonFrameSizeHeight;


- (id) initWithUIviewSize: (UIView*) uiViewScreen;
@end


