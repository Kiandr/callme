//
//  UITableViewControllerCustimized.m
//  CallMe
//
//  Created by Kian Davoudi-Rad on 2017-03-21.
//  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
//

#import<Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include "UIViewFrameOwekModel.h"
#import "UITableViewControllerCustimized.h"




@implementation UITableViewControllerCustimized

- (void)loadView:(UIView*)uiView
{
    
//    UIViewFrameOwekModel  * model =[[UIViewFrameOwekModel alloc] initWithUIviewSize:uiView];
    UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStylePlain];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView reloadData];

    self.uiTableView = tableView;

    /*Adding UITableView init here too*/
//    _uiTableView = [[UITableView alloc]initWithFrame:CGRectMake(model.uiTableViewFrameOriginex, model.uiTableViewFrameOriginey, model.uiTableViewFrameSizeHeight, model.uiTableViewFrameSizeWidth)style:UITableViewStyleGrouped];
////    UiTableView = [[UITableView alloc]initWithFrame:CGRectMake(but.frame.origin.x, but.frame.origin.y+but.frame.size.height , window.frame.size.width, (window.frame.size.height-(but.frame.size.height+datePicker.frame.size.height)))style:UITableViewStyleGrouped];
//    
    //    UiTableView.dataSource = self;
    //     UiTableView.delegate = self;
    
    
    
//    [view1 addSubview:UiTableView];
    
    
    
}

@end
