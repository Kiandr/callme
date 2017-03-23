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


@interface UIViewManager : UIView <UITableViewDelegate, UITableViewDataSource>
@property(nonatomic,strong) UIButton* UItoDateButton;

@property (nonatomic, strong ) UITableView* uiTableView;

@property (nonatomic) NSArray *timeZoneNames;
@end


@implementation UIViewManager   
{
    UIDatePicker * DatePickerUiComponent;
    UITableView  * UiTableView;
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
- (UIView*)  buildAViewAndLoadIntoMainViewParameteizedAndDatePicker {
UIColor * NNDBrandColour = [UIColor colorWithRed:236.0f green:0.0f blue:139.0f alpha:1.0f];
   

    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor colorWithRed:236.0f green:0.0f blue:139.0f alpha:1.0f];
    UIWindow* window = [UIApplication sharedApplication].delegate.window;
    
    CGSize viewSize = window.frame.size;
    CGPoint mainViewCoordinates = window.bounds.origin;
    // U coud put this coordinates into a propoer strucutre of code, TODO!
    view1.frame = CGRectMake(mainViewCoordinates.x, mainViewCoordinates.y+([[UIApplication sharedApplication] statusBarFrame].size.height), window.frame.size.width, window.frame.size.height-[[UIApplication sharedApplication] statusBarFrame].size.height);
    
    /* UIPicker Function*/
    /*To be encamsulated into a prpoer class*/
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    
    DatePickerUiComponent = datePicker;
    
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    //TODO:  put this coordinates into a propoer strucutre of code, TODO!
    datePicker.frame = CGRectMake(mainViewCoordinates.x, mainViewCoordinates.y+([[UIApplication sharedApplication] statusBarFrame].size.height), window.frame.size.width, (window.frame.size.height-[[UIApplication sharedApplication] statusBarFrame].size.height)/10);;
    
    // TODO:
    // Call back function to delegate method

    
    [view1 addSubview:datePicker];
    
    /*Button build*/
    CGSize buttPickerSize = datePicker.frame.size;
    CGPoint buttPickerCoordinates = datePicker.frame.origin;
    
    UIButton *but= [UIButton buttonWithType:UIButtonTypeSystem];
    [but addTarget:self action:@selector(event_button_click:) forControlEvents:UIControlEventTouchUpInside];
    [but setExclusiveTouch:YES];
    but.frame =CGRectMake(datePicker.frame.origin.x, datePicker.frame.origin.y+ datePicker.frame.size.height, window.frame.size.width/*/4*/, (window.frame.size.height-[[UIApplication sharedApplication] statusBarFrame].size.height)/10);
    [but setTitle:@"set Today" forState:UIControlStateNormal];
    [but setExclusiveTouch:YES];
    [but setBackgroundColor:NNDBrandColour];
    [but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [but setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    
    [view1 addSubview:but];
    
    
    UiTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 400, 400) style:UITableViewStylePlain];
        _uiTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _uiTableView.delegate = self;
        _uiTableView.dataSource = self;
    
    
    
    
    
//    UITableViewControllerCustimized *t = [[UITableViewControllerCustimized alloc]init];
//    [view1 addSubview:[t loadView:window]];
//    

    
    
    [view1 addSubview: UiTableView];
    return view1;
}

- (void)     event_button_click:(id)sender{
    [DatePickerUiComponent setDate:[NSDate date]];
    NSLog(@"Success!Do what event you want when click button (Touch up inside)");
}



#pragma mark - Table View Data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section{
    return self.timeZoneNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    /*
     Retrieve a cell with the given identifier from the table view.
     The cell is defined in the main storyboard: its identifier is MyIdentifier, and  its selection style is set to None.
     */
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    // Set up the cell.
    NSString *timeZoneName = self.timeZoneNames[indexPath.row];
    cell.textLabel.text = timeZoneName;
    
    return cell;
    
}

// Default is 1 if not implemented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

@end




/*
 Notes:
    // Refference:                          http://stackoverflow.com/questions/30728062/add-views-in-uistackview-programmatically
    // How to change to a date only mode    http://stackoverflow.com/questions/15119565/showing-a-particular-date-in-uidatepicker-in-uidatepickermodedate-on-the-iphone
 */
