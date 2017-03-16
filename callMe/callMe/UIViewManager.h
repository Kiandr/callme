//
//  UIViewManager.h
//  callMe
//
//  Created by Kian Davoudi-Rad on 2017-03-14.
//  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
//
#include "UIViewManagerProtocol.h"

@interface UIViewManager:NSObject<UIViewManagerProtocol>

@property(nonatomic , strong) UIButton *TodayButton;
@property(nonatomic , strong) UIDatePicker *TodayUIDatePickerValue;

-(void) buildAViewAndLoadIntoMainViewParameteized:(ViewController *) mainView;
-(UIStackView*) buildAViewAndReturnViewToBeLoadedAsWished;
-(void) AddDataPickerToThisView:(ViewController*)mainViewController;
-(void) buildAViewAndLoadIntoMainViewParameteizedAndDatePicker:(ViewController *) mainView ;
@end

