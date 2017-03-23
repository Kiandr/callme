////
////  UITableViewControllerCustimized.m
////  CallMe
////
////  Created by Kian Davoudi-Rad on 2017-03-21.
////  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
////
//
//#import<Foundation/Foundation.h>
//#import <UIKit/UIKit.h>
//#import "UITableViewControllerCustimized.h"
//#import "UIViewFrameWorkModel.h"
//
//
//
//@implementation UITableViewControllerCustimized
//
//- (id) init
//{
//    self = [super init];
//    if (self)
//    {
//    }
//    return self;
//}
//
//
//- (UITableView*)loadView:(UIView*)uiView
//{
//    UIViewFrameWorkModel *model  = [[UIViewFrameWorkModel alloc]initWithUIviewSize:uiView];
//    
//    _uiTableView = [[UITableView alloc] initWithFrame:CGRectMake(model.uiTableViewFrameOriginex, model.uiTableViewFrameOriginey, model.uiTableViewFrameSizeWidth, model.uiTableViewFrameSizeHeight) style:UITableViewStylePlain];
////    _uiTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
////    _uiTableView.delegate = self;
////    _uiTableView.dataSource = self;
////    _uiTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//    
//    
//
//    
//    return _uiTableView;
//    
//}
//
//
//
//#pragma mark - Table View Data source
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
//(NSInteger)section{
//    return self.timeZoneNames.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
//(NSIndexPath *)indexPath{
//    static NSString *MyIdentifier = @"MyIdentifier";
//    
//    /*
//     Retrieve a cell with the given identifier from the table view.
//     The cell is defined in the main storyboard: its identifier is MyIdentifier, and  its selection style is set to None.
//     */
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
//    
//    // Set up the cell.
//    NSString *timeZoneName = self.timeZoneNames[indexPath.row];
//    cell.textLabel.text = timeZoneName;
//    
//    return cell;
//
//}
//
//// Default is 1 if not implemented
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}
//
//@end
