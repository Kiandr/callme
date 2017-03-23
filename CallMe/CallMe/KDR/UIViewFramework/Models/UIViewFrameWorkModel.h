//
//  UIViewFrameOwekModel.h
//  CallMe
//
//  Created by Kian Davoudi-Rad on 2017-03-21.
//  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
//

#import<Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIViewFrameWorkModel : NSObject

// UIButton
@property (nonatomic,assign)  NSInteger* setTodatebuttonFrameOriginex;
@property (nonatomic,assign)  NSInteger* setTodatebuttonFrameOriginey;
@property (nonatomic,assign)  NSInteger* setTodatebuttonFrameSizeHeight;
@property (nonatomic,assign)  NSInteger* setTodatebuttonFrameSizeWidth;

// UITablePicker
@property (nonatomic,assign)  NSInteger* datePickerFrameOriginex;
@property (nonatomic,assign)  NSInteger* datePickerFrameOriginey;
@property (nonatomic,assign)  NSInteger* datePickerFrameSizeHeight;
@property (nonatomic,assign)  NSInteger* datePickerFrameSizeWidth;

// UITableView
@property (nonatomic,assign)  CGFloat uiTableViewFrameOriginex;
@property (nonatomic,assign)  CGFloat uiTableViewFrameOriginey;
@property (nonatomic,assign)  CGFloat uiTableViewFrameSizeHeight;
@property (nonatomic,assign)  CGFloat uiTableViewFrameSizeWidth;

- (id) initWithUIviewSize: (UIView*) uiViewScreen;
@end


