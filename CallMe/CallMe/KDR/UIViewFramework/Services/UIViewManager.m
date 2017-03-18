//
//  UIViewManager.m
//  callMe
//
//  Created by Kian Davoudi-Rad on 2017-03-14.
//  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIViewManager : NSObject 
@property(nonatomic,strong) UIButton* UItoDateButton;
//@property(nonatomic,strong) UIDatePicker* DatePickerUiComponent;

@end


@implementation UIViewManager : NSObject  
{
    UIDatePicker * DatePickerUiComponent;


}
- (id) init
{
    self = [super init];
    if (self) {
        // All initializations you need
    }
    return self;
}

/*ToDO
 properly advocate functions to manage origins and framesize for heat member, 
 You need a datastructure as datePicker, Button with extened class that has setters
*/
-(UIView*) buildAViewAndLoadIntoMainViewParameteizedAndDatePicker {

   
    // Refference: http://stackoverflow.com/questions/30728062/add-views-in-uistackview-programmatically
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor colorWithRed:236.0f green:0.0f blue:139.0f alpha:1.0f];
    UIWindow* window = [UIApplication sharedApplication].delegate.window;
    
    CGSize viewSize = window.frame.size;
    CGPoint mainViewCoordinates = window.bounds.origin;
    // U coud put this coordinates into a propoer strucutre of code, TODO!
    view1.frame = CGRectMake(mainViewCoordinates.x, mainViewCoordinates.y+([[UIApplication sharedApplication] statusBarFrame].size.height), window.frame.size.width, window.frame.size.height-[[UIApplication sharedApplication] statusBarFrame].size.height);
    // Load view to mainSuperview
//    [mainView.view addSubview:view1];
//[[UIApplication sharedApplication].keyWindow addSubview:view1];
    

    
    /* UIPicker Function*/
    /*To be encamsulated into a prpoer class*/
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    
    DatePickerUiComponent = datePicker;
    
    // How to change to a date only mode : http://stackoverflow.com/questions/15119565/showing-a-particular-date-in-uidatepicker-in-uidatepickermodedate-on-the-iphone
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    //TODO:  put this coordinates into a propoer strucutre of code, TODO!
    datePicker.frame = CGRectMake(mainViewCoordinates.x, mainViewCoordinates.y+([[UIApplication sharedApplication] statusBarFrame].size.height), window.frame.size.width, (window.frame.size.height-[[UIApplication sharedApplication] statusBarFrame].size.height)/10);;
    
    // TODO:
    // Call back function to delegate method
//    [datePicker addTarget:self action:@selector(DatePickerCallBackFunction:) forControlEvents:UIControlEventValueChanged];
    
    // Add date piker to the this view controller.
    [view1 addSubview:datePicker];
    
    /*Button build*/
    
    CGSize buttPickerSize = datePicker.frame.size;
    CGPoint buttPickerCoordinates = datePicker.frame.origin;
    
    
    
    UIButton *but= [UIButton buttonWithType:UIButtonTypeSystem];
    
    
    [but addTarget:self action:@selector(event_button_click:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [but setExclusiveTouch:YES];
    but.frame =CGRectMake(datePicker.frame.origin.x, datePicker.frame.origin.y+ datePicker.frame.size.height, window.frame.size.width/*/4*/, (window.frame.size.height-[[UIApplication sharedApplication] statusBarFrame].size.height)/10);
//    [but addTarget:h action:@selector(event_button_click:) forControlEvents:UIControlEventTouchUpInside];
//    [but setFrame:CGRectMake(mainViewCoordinates.x, mainViewCoordinates.y+([[UIApplication sharedApplication] statusBarFrame].size.height), mainView.view.frame.size.width, (mainView.view.frame.size.height-[[UIApplication sharedApplication] statusBarFrame].size.height)/10)];
    [but setTitle:@"set Today" forState:UIControlStateNormal];
    [but setExclusiveTouch:YES];
//    but.backgroundColor=[UIColor redColor];
    [but setBackgroundColor:[UIColor redColor]];
    [but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [but setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    [view1 addSubview:but];
//    _toDateButton = but;
    return view1;
}
-(void)event_button_click:(id)sender{
    
    [DatePickerUiComponent setDate:[NSDate date]];
    
    NSLog(@"Success!Do what event you want when click button (Touch up inside)");
}


@end
