//
//  ViewController.m
//  CallMe
//
//  Created by Kian Davoudi-Rad on 2017-03-15.
//  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
//

#import "ViewController.h"
#include "UIViewManager.h"
#import "ICalServices.h"

@interface ViewController ()
@property(nonatomic,strong)UIViewManager *uiManager;
@property(nonatomic,strong)ICalServices *calServices;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     _uiManager= [[UIViewManager alloc]init];
     [self.view addSubview:[_uiManager buildAViewAndLoadIntoMainViewParameteizedAndDatePicker]];
    _calServices = [[ICalServices alloc]init];
    [_calServices checkEventStoreAccessForCalendar];
    [_calServices loadCalanderServices];
//
    [_calServices fetchEvents];
    /*
     
     - (void) loadCalanderServices;
     - (void) checkEventStoreAccessForCalendar;
     - (NSMutableArray *)fetchEvents;
     */

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
