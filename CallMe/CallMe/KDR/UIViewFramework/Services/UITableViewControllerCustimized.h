//
//  UITableViewControllerCustimized.h
//  CallMe
//
//  Created by Kian Davoudi-Rad on 2017-03-21.
//  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
//
#import<Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIViewFrameOwekModel.h"


@interface UITableViewControllerCustimized : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong ) UITableView* uiTableView;

- (void)loadView:(UIView*)uiView;
@end

