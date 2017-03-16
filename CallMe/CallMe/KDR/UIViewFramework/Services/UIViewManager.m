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

-(void) buildAViewAndLoadIntoMainViewParameteized:(ViewController *) mainView {

    // Refference: http://stackoverflow.com/questions/30728062/add-views-in-uistackview-programmatically
    //View 1
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor blueColor];
    [view1.heightAnchor constraintEqualToConstant:100].active = true;
    [view1.widthAnchor constraintEqualToConstant:200].active = true;
    
    
    
    //Stack View
    UIStackView *stackView = [[UIStackView alloc] init];
    
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionEqualSpacing;
    stackView.alignment = UIStackViewAlignmentCenter;
    stackView.spacing = 10;
    
    // I dont know what is this for?
    [stackView addArrangedSubview:view1];
    stackView.translatesAutoresizingMaskIntoConstraints = false;
    
    
    // Add new View into the main Contorller view
    [mainView.view addSubview:stackView];
    
    //Layout for Stack View
    [stackView.centerXAnchor constraintEqualToAnchor:mainView.view.centerXAnchor].active = true;
    [stackView.centerYAnchor constraintEqualToAnchor:mainView.view.centerYAnchor].active = true;
    

}

-(UIStackView*) buildAViewAndReturnViewToBeLoadedAsWished{
    
    //View 1
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor blueColor];
    [view1.heightAnchor constraintEqualToConstant:100].active = true;
    [view1.widthAnchor constraintEqualToConstant:200].active = true;
    
    
    
    //Stack View
    UIStackView *stackView = [[UIStackView alloc] init];
    
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionEqualSpacing;
    stackView.alignment = UIStackViewAlignmentCenter;
    stackView.spacing = 10;
    
    
    [stackView addArrangedSubview:view1];
    stackView.translatesAutoresizingMaskIntoConstraints = false;
    
    return stackView;

}

-(void) AddDataPickerToThisView:(ViewController*)mainViewController{
    UIViewManager *
    
    
    _view = [[UIViewManager alloc] init];
//    [_view delegate] = NULL;
//    [self.lib startUpdatingCount];
    
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
    view1.backgroundColor = [UIColor blueColor];
    [view1.heightAnchor constraintEqualToConstant:100].active = true;
    [view1.widthAnchor constraintEqualToConstant:200].active = true;
    
    
    
    //Stack View
    UIStackView *stackView = [[UIStackView alloc] init];
    
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionEqualSpacing;
    stackView.alignment = UIStackViewAlignmentCenter;
    stackView.spacing = 10;
    
    // I dont know what is this for?
    [stackView addArrangedSubview:view1];
    stackView.translatesAutoresizingMaskIntoConstraints = false;
    
    
    // Add new View into the main Contorller view
    [mainView.view addSubview:stackView];
    
    //Layout for Stack View
    [stackView.centerXAnchor constraintEqualToAnchor:mainView.view.centerXAnchor].active = true;
    [stackView.centerYAnchor constraintEqualToAnchor:mainView.view.centerYAnchor].active = true;
    
    // Build and deplou datePicker
    [self AddDataPickerToThisView:mainView];
    
//    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
//    [mainView.view addSubview:datePicker];

}


@end
