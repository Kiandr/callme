//
//  ViewController.m
//  callMe
//
//  Created by Kian Davoudi-Rad on 2017-03-13.
//  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
//

#import "ViewController.h"
#include "UIViewManager.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // LoadViewManager - Global Delegate that manages all sort of view deployments.
    UIViewManager *viewmanager = [[UIViewManager alloc] init];
    
    
    

    
//    [viewmanager buildAViewAndLoadIntoMainViewParameteized:self];
//    [viewmanager AddDataPickerToThisView:self];
//    
    [viewmanager buildAViewAndLoadIntoMainViewParameteizedAndDatePicker:self] ;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
