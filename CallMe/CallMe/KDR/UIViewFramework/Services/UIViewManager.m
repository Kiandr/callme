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


- (UIView*) mainViewInit : (UIViewFrameWorkModel *)localUIViewFrameWorkModel setBrandColour:(UIColor*) locBrandColour;
{
    UIView *tempView = [[UIView alloc] init];
    tempView.backgroundColor = locBrandColour;
    tempView.frame = CGRectMake(localUIViewFrameWorkModel.uiTableViewFrameOriginex,localUIViewFrameWorkModel.uiTableViewFrameOriginey, localUIViewFrameWorkModel.uiTableViewFrameSizeWidth,localUIViewFrameWorkModel.uiTableViewFrameSizeHeight);
    // build table and deploy

    return tempView;
};

-(UIColor*) setnNDBrandColour
{
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

-(UIViewFrameWorkModel*) setOriginesOfWindow{

    UIViewFrameWorkModel * locUIViewFrameWorkModel = [[UIViewFrameWorkModel alloc]init];

    @try {
        UIWindow* windowView = [UIApplication sharedApplication].delegate.window;
        locUIViewFrameWorkModel.uiTableViewFrameOriginex    = windowView.frame.origin.x;
        locUIViewFrameWorkModel.uiTableViewFrameOriginey    = windowView.frame.origin.y     +([[UIApplication sharedApplication] statusBarFrame].size.height);
        locUIViewFrameWorkModel.uiTableViewFrameSizeWidth   = windowView.frame.size.width;
        locUIViewFrameWorkModel.uiTableViewFrameSizeHeight  = windowView.frame.size.height  -([[UIApplication sharedApplication] statusBarFrame].size.height);
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
    }

    return locUIViewFrameWorkModel;
}

// Main Entry
- (UIView*)  buildAViewAndLoadIntoMainViewParameteizedAndDatePicker {

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


