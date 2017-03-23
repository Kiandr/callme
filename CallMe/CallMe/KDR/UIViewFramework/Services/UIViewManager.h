//
//  UIViewManager.h
//  CallMe
//
//  Created by Kian Davoudi-Rad on 2017-03-16.
//  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
//
#import<Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIViewManagerProtocol.h"
#import "UIViewFrameWorkModel.h"

@class UIViewManager;

@interface UIViewManager : UIView <UITableViewDelegate, UITableViewDataSource>

// Properties
@property (nonatomic, strong) UIButton*                 uItodateButton;
@property (nonatomic, strong) UITableView*              uITableView;
@property (nonatomic, strong) UIColor*                  nNDBrandColour;
@property (nonatomic, strong) UIViewFrameWorkModel*     frameWorkModel;



// Main function available to viewController to deploy assets
- (id)      init;
- (UIView*) buildAViewAndLoadIntoMainViewParameteizedAndDatePicker;
- (void)    callBackFunctionFromButton:(NSString*) someInput;
- (void)    buildAndLoadUITableView;

@end
