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
-(UIView*)  mainViewInit:       (UIViewFrameWorkModel *)    localUIViewFrameWorkModel setBrandColour:(UIColor*) locBrandColour{
    UIView *tempView = [[UIView alloc] init];
    tempView.backgroundColor = locBrandColour;
    tempView.frame = CGRectMake(localUIViewFrameWorkModel.uiTableViewFrameOriginex,localUIViewFrameWorkModel.uiTableViewFrameOriginey, localUIViewFrameWorkModel.uiTableViewFrameSizeWidth,localUIViewFrameWorkModel.uiTableViewFrameSizeHeight);
    // build Brand Header
    [tempView addSubview:[self addBrandHeader:localUIViewFrameWorkModel]];
    // build Date Picker
    [tempView addSubview:[self addDatePicker:localUIViewFrameWorkModel]];
    // build Date Picker
    [tempView addSubview:[self addBrandFooter:localUIViewFrameWorkModel]];


    return tempView;
}
-(UIView*)  addBrandFooter:     (UIViewFrameWorkModel*)     localUIViewFrameWorkModel {

    UIView * uiBrandFooterView = [[UIView alloc] initWithFrame:CGRectMake(localUIViewFrameWorkModel.uiFrameFooterFrameOriginex , localUIViewFrameWorkModel.uiFrameFooterFrameOriginey , localUIViewFrameWorkModel.uiFrameFooterFrameSizeWidth, localUIViewFrameWorkModel.uiFrameFooterFrameSizeHeight)];
    uiBrandFooterView.backgroundColor = [UIColor blueColor];

    UIButton *upcomingVisistsButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    upcomingVisistsButton.frame = CGRectMake(localUIViewFrameWorkModel.uiUpcomingVisistsButtonFrameOriginex,localUIViewFrameWorkModel.uiUpcomingVisistsButtonFrameOriginey,localUIViewFrameWorkModel.uiFrameFooterFrameSizeWidth,localUIViewFrameWorkModel.uiFrameFooterFrameSizeHeight);
    upcomingVisistsButton.backgroundColor = [UIColor yellowColor];
    // This shall be localized for various languages
    NSString *UpcomingVisits = [[NSString alloc] initWithFormat:@"Upcoming Visists"];

    [upcomingVisistsButton setTitle:UpcomingVisits forState:UIControlStateNormal];
    [upcomingVisistsButton setTintColor:[UIColor whiteColor]];

    [uiBrandFooterView addSubview:upcomingVisistsButton];

    return uiBrandFooterView;
}
-(UIView*)  addDatePicker:      (UIViewFrameWorkModel*)     localUIViewFrameWorkModel {
    UIView* datePickerView = [[UIView alloc]initWithFrame:CGRectMake(localUIViewFrameWorkModel.uiDatePickerFrameOriginex, localUIViewFrameWorkModel.uiDatePickerFrameOriginey, localUIViewFrameWorkModel.uiDatePickerFrameSizeWidth,localUIViewFrameWorkModel.uiDatePickerFrameSizeHeight)];
    // Debugger Remove for production
    datePickerView.backgroundColor = [UIColor greenColor];

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
        localUIViewFrameWorkModel.uiTableViewFrameOriginex              = windowView.frame.origin.x;
        localUIViewFrameWorkModel.uiTableViewFrameOriginey              = windowView.frame.origin.y     +([[UIApplication sharedApplication] statusBarFrame].size.height);
        localUIViewFrameWorkModel.uiTableViewFrameSizeWidth             = windowView.frame.size.width;
        localUIViewFrameWorkModel.uiTableViewFrameSizeHeight            = windowView.frame.size.height  -([[UIApplication sharedApplication] statusBarFrame].size.height);

        // BrandHeader
        localUIViewFrameWorkModel.uiBrandHeaderFrameOriginex           = windowView.frame.origin.x;
        localUIViewFrameWorkModel.uiBrandHeaderFrameOriginey           = windowView.frame.origin.y;
        localUIViewFrameWorkModel.uiBrandHeaderFrameSizeWidth          = windowView.frame.size.width;
        localUIViewFrameWorkModel.uiBrandHeaderFrameSizeHeight         = 30;

        // BrandIcon
        localUIViewFrameWorkModel.uiBrandIconFrameOriginex             = (localUIViewFrameWorkModel.uiBrandHeaderFrameSizeWidth/2)-20;
        localUIViewFrameWorkModel.uiBrandIconFrameOriginey             = windowView.frame.origin.y;
        localUIViewFrameWorkModel.uiBrandIconFrameSizeWidth            = 40;
        localUIViewFrameWorkModel.uiBrandIconFrameSizeHeight           = 30;

        // DatePicker
        localUIViewFrameWorkModel.uiDatePickerFrameOriginex             = windowView.frame.origin.x;
        localUIViewFrameWorkModel.uiDatePickerFrameOriginey             = windowView.frame.origin.y+ localUIViewFrameWorkModel.uiBrandIconFrameSizeHeight;
        localUIViewFrameWorkModel.uiDatePickerFrameSizeWidth            = windowView.frame.size.width;
        localUIViewFrameWorkModel.uiDatePickerFrameSizeHeight           = windowView.frame.size.height/5;

        // FrameFooter
        localUIViewFrameWorkModel.uiFrameFooterFrameOriginex             = windowView.frame.origin.x;
        localUIViewFrameWorkModel.uiFrameFooterFrameOriginey             = localUIViewFrameWorkModel.uiDatePickerFrameOriginey + localUIViewFrameWorkModel.uiDatePickerFrameSizeHeight ;
        localUIViewFrameWorkModel.uiFrameFooterFrameSizeWidth            = windowView.frame.size.width;
        localUIViewFrameWorkModel.uiFrameFooterFrameSizeHeight           = localUIViewFrameWorkModel.uiBrandHeaderFrameSizeHeight ;

        //upcomingVisistsButton
        localUIViewFrameWorkModel.uiUpcomingVisistsButtonFrameOriginex             = windowView.frame.origin.x;
        localUIViewFrameWorkModel.uiUpcomingVisistsButtonFrameOriginey             = localUIViewFrameWorkModel.uiFrameFooterFrameOriginey;
        localUIViewFrameWorkModel.uiUpcomingVisistsButtonFooterFrameSizeWidth      = windowView.frame.size.width;
        localUIViewFrameWorkModel.uiUpcomingVisistsButtonFrameSizeHeight           = localUIViewFrameWorkModel.uiFrameFooterFrameSizeHeight;


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














//    @property (nonatomic,assign)  CGFloat uiTableViewFrameOriginex;
//    @property (nonatomic,assign)  CGFloat uiTableViewFrameOriginey;
//    @property (nonatomic,assign)  CGFloat uiTableViewFrameSizeHeight;
//    @property (nonatomic,assign)  CGFloat uiTableViewFrameSizeWidth;


//    _uiTableView = mainViewInit();


    //
//
//    UIView *view1 = [[UIView alloc] init];
//    view1.backgroundColor = [UIColor colorWithRed:236.0f green:0.0f blue:139.0f alpha:1.0f];
//    UIWindow* window = [UIApplication sharedApplication].delegate.window;
//    
//    CGSize viewSize = window.frame.size;
//    CGPoint mainViewCoordinates = window.bounds.origin;
//    // U coud put this coordinates into a propoer strucutre of code, TODO!
//    view1.frame = CGRectMake(mainViewCoordinates.x, mainViewCoordinates.y+([[UIApplication sharedApplication] statusBarFrame].size.height), window.frame.size.width, window.frame.size.height-[[UIApplication sharedApplication] statusBarFrame].size.height);
//    
//    /* UIPicker Function*/
//    /*To be encamsulated into a prpoer class*/
//    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
//    
//    DatePickerUiComponent = datePicker;
//    
//    
//    datePicker.datePickerMode = UIDatePickerModeDate;
//    
//    //TODO:  put this coordinates into a propoer strucutre of code, TODO!
//    datePicker.frame = CGRectMake(mainViewCoordinates.x, mainViewCoordinates.y+([[UIApplication sharedApplication] statusBarFrame].size.height), window.frame.size.width, (window.frame.size.height-[[UIApplication sharedApplication] statusBarFrame].size.height)/10);;
//    
//    // TODO:
//    // Call back function to delegate method
//
//    
//    [view1 addSubview:datePicker];
//    
//    /*Button build*/
//    CGSize buttPickerSize = datePicker.frame.size;
//    CGPoint buttPickerCoordinates = datePicker.frame.origin;
//    
//    UIButton *but= [UIButton buttonWithType:UIButtonTypeSystem];
//    [but addTarget:self action:@selector(event_button_click:) forControlEvents:UIControlEventTouchUpInside];
//    [but setExclusiveTouch:YES];
//    but.frame =CGRectMake(datePicker.frame.origin.x, datePicker.frame.origin.y+ datePicker.frame.size.height, window.frame.size.width/*/4*/, (window.frame.size.height-[[UIApplication sharedApplication] statusBarFrame].size.height)/10);
//    [but setTitle:@"set Today" forState:UIControlStateNormal];
//    [but setExclusiveTouch:YES];
//    [but setBackgroundColor:NNDBrandColour];
//    [but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [but setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
//    
//    [view1 addSubview:but];
//
//    
//    [view1 addSubview: UiTableView];
//    return view1;
//}

//- (void)     event_button_click:(id)sender{
//    [DatePickerUiComponent setDate:[NSDate date]];
//    NSLog(@"Success!Do what event you want when click button (Touch up inside)");
//}



/*
 Notes:
    // Refference:                          http://stackoverflow.com/questions/30728062/add-views-in-uistackview-programmatically
    // How to change to a date only mode    http://stackoverflow.com/questions/15119565/showing-a-particular-date-in-uidatepicker-in-uidatepickermodedate-on-the-iphone
 */


