//
//  UIViewManager.m
//  callMe
//
//  Created by Kian Davoudi-Rad on 2017-03-14.
//  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"
#import "UIViewManager.h"


@implementation UIViewManager : NSObject


-(void) AddDataPickerToThisView:(ViewController*)mainViewController{
    UIViewManager * view = [[UIViewManager alloc] init];
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.frame = CGRectMake(0, 50, 300, 162);
    datePicker.bounds = CGRectMake(0, 50, 300, 162);
    [datePicker setDate:[NSDate dateWithTimeIntervalSinceNow:0] animated:true ];
    [datePicker addTarget:self action:@selector(DatePickerCallBackFunction:) forControlEvents:UIControlEventValueChanged];
    [mainViewController.view addSubview:datePicker];
  
}


-(void) buildAViewAndLoadIntoMainViewParameteizedAndDatePicker:(ViewController *) mainView {

    // Refference: http://stackoverflow.com/questions/30728062/add-views-in-uistackview-programmatically
    //View 1
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor colorWithRed:236.0f green:0.0f blue:139.0f alpha:1.0f];
//    [view1.heightAnchor constraintEqualToConstant:100].active = true;
//    [view1.widthAnchor constraintEqualToConstant:200].active = true;
////
    CGSize viewSize = mainView.view.frame.size;
    CGPoint mainViewCoordinates = mainView.view.bounds.origin;
    view1.frame = CGRectMake(mainViewCoordinates.x, mainViewCoordinates.y+([[UIApplication sharedApplication] statusBarFrame].size.height), mainView.view.frame.size.width, mainView.view.frame.size.height-[[UIApplication sharedApplication] statusBarFrame].size.height);
//CGSize statusBarSize = [[UIApplication sharedApplication] statusBarFrame].size;
//    UIWindow *w =  [UIApplication sharedApplication].keyWindow;
//    [mainView.navigationController.navigationBar addSubview:view1];

    

    

    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    // How to change to a date only mode : http://stackoverflow.com/questions/15119565/showing-a-particular-date-in-uidatepicker-in-uidatepickermodedate-on-the-iphone
    datePicker.datePickerMode = UIDatePickerModeDate;
    // set sizeof screen 1/10 of mainSuperview
    datePicker.frame = CGRectMake(mainViewCoordinates.x, mainViewCoordinates.y+([[UIApplication sharedApplication] statusBarFrame].size.height), mainView.view.frame.size.width, (mainView.view.frame.size.height-[[UIApplication sharedApplication] statusBarFrame].size.height)/10);;
    [datePicker addTarget:self action:@selector(DatePickerCallBackFunction:) forControlEvents:UIControlEventValueChanged];
    // Add date piker to the this view controller.
    [view1 addSubview:datePicker];
    
    
    // Load view to mainSuperview
    [mainView.view addSubview:view1];
}

@end
