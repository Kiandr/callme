//
//  ViewController.m
//  CallMe
//
//  Created by Kian Davoudi-Rad on 2017-03-15.
//  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
//

#import "ViewController.h"
#include "UIViewManager.h"

@interface ViewController ()
@property(nonatomic,strong)UIViewManager *uiManager;
@end

@implementation ViewController

//@synthesize uiManager = _uiManager;
//{
//UIViewManager *uiManager;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    UIViewManager  *LocUiManager = [[UIViewManager alloc] init];
//    _uiManager =[[UIViewManager alloc] init];
//    uiManager = LocUiManager;
// [self.view addSubview:[LocUiManager buildAViewAndLoadIntoMainViewParameteizedAndDatePicker]];
     _uiManager= [[UIViewManager alloc]init];
//  UIView *test = _uiManager.buildAViewAndLoadIntoMainViewParameteizedAndDatePicker;
//        UIView *test =[_uiManager buildAViewAndLoadIntoMainViewParameteizedAndDatePicker];
     [self.view addSubview:[_uiManager buildAViewAndLoadIntoMainViewParameteizedAndDatePicker]];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
