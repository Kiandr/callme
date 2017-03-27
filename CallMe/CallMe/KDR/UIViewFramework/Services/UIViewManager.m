//
//  UIViewManager.m
//  callMe
//
//  Created by Kian Davoudi-Rad on 2017-03-14.
//  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UITableViewControllerCustimized.h"
#import "UIViewManager.h"
#import "UIViewFrameWorkModel.h"

@implementation UIViewManager
-(UIView*)  mainViewInit:       (UIViewFrameWorkModel*)     localUIViewFrameWorkModel setBrandColour:(UIColor*) locBrandColour{
    UIView *tempView = [[UIView alloc] init];
    tempView.backgroundColor = locBrandColour;
    tempView.frame = CGRectMake(localUIViewFrameWorkModel.uiMainViewFrameOriginex,localUIViewFrameWorkModel.uiMainViewFrameOriginey, localUIViewFrameWorkModel.uiMainViewFrameSizeWidth,localUIViewFrameWorkModel.uiMainViewFrameSizeHeight);
    // build Brand Header
    [tempView addSubview:[self addBrandHeader:localUIViewFrameWorkModel]];
    // build Date Picker
    [tempView addSubview:[self addDatePicker:localUIViewFrameWorkModel]];
    // build Date Picker
    [tempView addSubview:[self addBrandFooter:localUIViewFrameWorkModel]];
    // build TableView
    [tempView addSubview:[self addUITableView:localUIViewFrameWorkModel]];

    return tempView;
}
-(UIView*)  addUITableView:     (UIViewFrameWorkModel*)     localUIViewFrameWorkModel {
    UITableView *localUITableView = [[UITableView alloc]initWithFrame:CGRectMake(localUIViewFrameWorkModel.uiTableViewFrameOriginex , localUIViewFrameWorkModel.uiTableViewFrameOriginey , localUIViewFrameWorkModel.uiTableViewFrameSizeWidth, localUIViewFrameWorkModel.uiTableViewFrameSizeHeight ) style:UITableViewCellStyleSubtitle];
    localUITableView.backgroundColor = _nNDBrandColour;
    return localUITableView;
};
-(UIView*)  addBrandFooter:     (UIViewFrameWorkModel*)     localUIViewFrameWorkModel {

    UIView * uiBrandFooterView = [[UIView alloc] initWithFrame:CGRectMake(localUIViewFrameWorkModel.uiFrameFooterFrameOriginex , localUIViewFrameWorkModel.uiFrameFooterFrameOriginey , localUIViewFrameWorkModel.uiFrameFooterFrameSizeWidth, localUIViewFrameWorkModel.uiFrameFooterFrameSizeHeight)];
    uiBrandFooterView.backgroundColor = [UIColor blueColor];

    UIButton *upcomingVisistsButton = [UIButton buttonWithType:UIButtonTypeSystem];
    upcomingVisistsButton.frame = CGRectMake(localUIViewFrameWorkModel.uiUpcomingVisistsButtonFrameOriginex,localUIViewFrameWorkModel.uiUpcomingVisistsButtonFrameOriginey,localUIViewFrameWorkModel.uiFrameFooterFrameSizeWidth,localUIViewFrameWorkModel.uiFrameFooterFrameSizeHeight);
    upcomingVisistsButton.backgroundColor = [UIColor clearColor];
    // This shall be localized for various languages
    NSString *UpcomingVisits = [[NSString alloc] initWithFormat:@"Upcoming Visists"];

    [upcomingVisistsButton setTitle:UpcomingVisits forState:UIControlStateNormal];
    [upcomingVisistsButton setTintColor:[UIColor whiteColor]];
    [upcomingVisistsButton addTarget:self  action:@selector(upcomingVisistsButtonCallBackFunction:) forControlEvents:UIControlEventTouchDown];
    [uiBrandFooterView addSubview:upcomingVisistsButton];

    return uiBrandFooterView;
}
-(void)     upcomingVisistsButtonCallBackFunction:(id*)     sender                    {

    [_UIDatePickerGlobarlVar setDate:[NSDate date]];
    // Update and refresh content of tableView

}
-(UIView*)  addDatePicker:      (UIViewFrameWorkModel*)     localUIViewFrameWorkModel {
    UIView* datePickerView = [[UIView alloc]initWithFrame:CGRectMake(localUIViewFrameWorkModel.uiDatePickerFrameOriginex, localUIViewFrameWorkModel.uiDatePickerFrameOriginey, localUIViewFrameWorkModel.uiDatePickerFrameSizeWidth,localUIViewFrameWorkModel.uiDatePickerFrameSizeHeight)];

    datePickerView.backgroundColor = [UIColor greenColor];
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(localUIViewFrameWorkModel.uiDatePickerOriginex, localUIViewFrameWorkModel.uiDatePickerOriginey, localUIViewFrameWorkModel.uiDatePickerSizeWidth, localUIViewFrameWorkModel.uiDatePickerSizeHeight)];
    datePicker.backgroundColor = [UIColor yellowColor];
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    [datePickerView addSubview:datePicker];
    _UIDatePickerGlobarlVar = datePicker;

    return datePickerView;
}
-(UIView*)  addBrandHeader:     (UIViewFrameWorkModel*)     localUIViewFrameWorkModel {

    UIView* brandHeaderView = [[UIView alloc]initWithFrame:CGRectMake(localUIViewFrameWorkModel.uiBrandHeaderFrameOriginex, localUIViewFrameWorkModel.uiBrandHeaderFrameOriginey, localUIViewFrameWorkModel.uiBrandHeaderFrameSizeWidth,localUIViewFrameWorkModel.uiBrandHeaderFrameSizeHeight)];

    UIImageView *brandIconImageFrameHolder =[[UIImageView alloc]initWithFrame:CGRectMake(localUIViewFrameWorkModel.uiBrandIconFrameOriginex, localUIViewFrameWorkModel.uiBrandIconFrameOriginey , localUIViewFrameWorkModel.uiBrandIconFrameSizeWidth , localUIViewFrameWorkModel.uiBrandIconFrameSizeHeight)];

    brandIconImageFrameHolder.image = [UIImage imageNamed:@"NNDIcon.png"];
    // Debugger, remove for production
    brandHeaderView.backgroundColor= [UIColor grayColor];
    [brandHeaderView addSubview:brandIconImageFrameHolder];

    return brandHeaderView;

}
-(UIColor*) setnNDBrandColour                                                         {
    UIColor *locBrandColor;
    @try
    {

        locBrandColor = [UIColor colorWithRed:236.0f green:0.0f blue:139.0f alpha:1.0f];
        _nNDBrandColour = locBrandColor;
    }

    @catch (NSException *exception)
    {
         NSLog(@"%@", exception.reason);
    }
    return locBrandColor;
}
-(UIViewFrameWorkModel*) setOriginesOfWindow                                          {

    UIViewFrameWorkModel * localUIViewFrameWorkModel = [[UIViewFrameWorkModel alloc]init];

    @try {
        UIWindow* windowView = [UIApplication sharedApplication].delegate.window;
        localUIViewFrameWorkModel.uiMainViewFrameOriginex              = windowView.frame.origin.x;
        localUIViewFrameWorkModel.uiMainViewFrameOriginey              = windowView.frame.origin.y     +([[UIApplication sharedApplication] statusBarFrame].size.height);
        localUIViewFrameWorkModel.uiMainViewFrameSizeWidth             = windowView.frame.size.width;
        localUIViewFrameWorkModel.uiMainViewFrameSizeHeight            = windowView.frame.size.height  -([[UIApplication sharedApplication] statusBarFrame].size.height);

        // BrandHeader
        localUIViewFrameWorkModel.uiBrandHeaderFrameOriginex           = windowView.frame.origin.x;
        localUIViewFrameWorkModel.uiBrandHeaderFrameOriginey           = windowView.frame.origin.y;
        localUIViewFrameWorkModel.uiBrandHeaderFrameSizeWidth          = windowView.frame.size.width;
        localUIViewFrameWorkModel.uiBrandHeaderFrameSizeHeight         = 35;

        // BrandIcon
        localUIViewFrameWorkModel.uiBrandIconFrameOriginex             = (localUIViewFrameWorkModel.uiBrandHeaderFrameSizeWidth/2)-20;
        localUIViewFrameWorkModel.uiBrandIconFrameOriginey             = windowView.frame.origin.y;
        localUIViewFrameWorkModel.uiBrandIconFrameSizeWidth            = 40;
        localUIViewFrameWorkModel.uiBrandIconFrameSizeHeight           =   localUIViewFrameWorkModel.uiBrandHeaderFrameSizeHeight ;

        // DatePickerFrame
        localUIViewFrameWorkModel.uiDatePickerFrameOriginex             = windowView.frame.origin.x;
        localUIViewFrameWorkModel.uiDatePickerFrameOriginey             = windowView.frame.origin.y+ localUIViewFrameWorkModel.uiBrandIconFrameSizeHeight;
        localUIViewFrameWorkModel.uiDatePickerFrameSizeWidth            = windowView.frame.size.width;
        localUIViewFrameWorkModel.uiDatePickerFrameSizeHeight           = windowView.frame.size.height/5;

        // DatePicker
        localUIViewFrameWorkModel.uiDatePickerOriginex                  = windowView.frame.origin.x;
        localUIViewFrameWorkModel.uiDatePickerOriginey                  = windowView.frame.origin.y;
        localUIViewFrameWorkModel.uiDatePickerSizeWidth                 = windowView.frame.size.width;
        localUIViewFrameWorkModel.uiDatePickerSizeHeight                = windowView.frame.size.height/5;

        // FrameFooter
        localUIViewFrameWorkModel.uiFrameFooterFrameOriginex             = windowView.frame.origin.x;
        localUIViewFrameWorkModel.uiFrameFooterFrameOriginey             = localUIViewFrameWorkModel.uiDatePickerFrameOriginey + localUIViewFrameWorkModel.uiDatePickerFrameSizeHeight ;
        localUIViewFrameWorkModel.uiFrameFooterFrameSizeWidth            = windowView.frame.size.width;
        localUIViewFrameWorkModel.uiFrameFooterFrameSizeHeight           = localUIViewFrameWorkModel.uiBrandHeaderFrameSizeHeight ;

        //upcomingVisistsButton
        localUIViewFrameWorkModel.uiUpcomingVisistsButtonFrameOriginex             = windowView.frame.origin.x;
        localUIViewFrameWorkModel.uiUpcomingVisistsButtonFrameOriginey             = windowView.frame.origin.y;
        localUIViewFrameWorkModel.uiUpcomingVisistsButtonFrameSizeWidth            = windowView.frame.size.width;
        localUIViewFrameWorkModel.uiUpcomingVisistsButtonFrameSizeHeight           = localUIViewFrameWorkModel.uiFrameFooterFrameSizeHeight;

        // UITableView
        localUIViewFrameWorkModel.uiTableViewFrameOriginex = 0;
        localUIViewFrameWorkModel.uiTableViewFrameOriginey =        localUIViewFrameWorkModel.uiFrameFooterFrameOriginey+ localUIViewFrameWorkModel.uiUpcomingVisistsButtonFrameSizeHeight ;
        localUIViewFrameWorkModel.uiTableViewFrameSizeWidth = windowView.frame.size.width;
        localUIViewFrameWorkModel.uiTableViewFrameSizeHeight = windowView.frame.size.height- localUIViewFrameWorkModel.uiFrameFooterFrameSizeHeight  - localUIViewFrameWorkModel.uiDatePickerSizeHeight - localUIViewFrameWorkModel.uiBrandHeaderFrameSizeHeight - ([[UIApplication sharedApplication] statusBarFrame].size.height);




    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
    }

    return localUIViewFrameWorkModel;
}
-(UIView*)  buildAViewAndLoadIntoMainViewParameteizedAndDatePicker                    {

    // Set the Brand Colour
    _nNDBrandColour = [UIColor colorWithRed:236.0f green:0.0f blue:139.0f alpha:1.0f];

    return ([self mainViewInit:[self setOriginesOfWindow] setBrandColour:_nNDBrandColour]);
}
@end

/*
 Notes:
    // Refference:                          http://stackoverflow.com/questions/30728062/add-views-in-uistackview-programmatically
    // How to change to a date only mode    http://stackoverflow.com/questions/15119565/showing-a-particular-date-in-uidatepicker-in-uidatepickermodedate-on-the-iphone
 */


