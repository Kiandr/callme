//
//  UIViewFrameOwekModel.h
//  CallMe
//
//  Created by Kian Davoudi-Rad on 2017-03-21.
//  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
//

#import<Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIViewFrameOwekModel : NSObject

@property (nonatomic,assign)  NSInteger* setTodatebuttonFrameOriginex;
@property (nonatomic,assign)  NSInteger* setTodatebuttonFrameOriginey;
@property (nonatomic,assign)  NSInteger* setTodatebuttonFrameSizeHeight;
@property (nonatomic,assign)  NSInteger* setTodatebuttonFrameSizeWidth;

@property (nonatomic,assign)  NSInteger* datePickerFrameOriginex;
@property (nonatomic,assign)  NSInteger* datePickerFrameOriginey;
@property (nonatomic,assign)  NSInteger* datePickerFrameSizeHeight;
@property (nonatomic,assign)  NSInteger* datePickerFrameSizeWidth;

@property (nonatomic,assign)  CGFloat uiTableViewFrameOriginex;
@property (nonatomic,assign)  CGFloat uiTableViewFrameOriginey;
@property (nonatomic,assign)  CGFloat uiTableViewFrameSizeHeight;
@property (nonatomic,assign)  CGFloat uiTableViewFrameSizeWidth;




- (id) initWithUIviewSize: (UIView*) uiViewScreen;
@end


@implementation UIViewFrameOwekModel

- (id) initWithUIviewSize: (UIView*) uiViewScreen
{
    self = [super init];
    if (self)
    {
        // Superclass successfully initialized.
        self->_uiTableViewFrameOriginex = 0;
        
        CGFloat t_y = uiViewScreen.window.frame.size.height;
        self->_uiTableViewFrameSizeHeight    = t_y;
        
        CGFloat t_w =  uiViewScreen.window.frame.size.width;
        self->_uiTableViewFrameSizeWidth = t_w;
    }
    return self;
    
}

//-(int) getButtonFrameHeight{
//    
///*
// 
// 
// /*Adding UITableView init here too*/
//    //UiTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)style:UITableViewStyleGrouped];
//    //    UiTableView = [[UITableView alloc]initWithFrame:CGRectMake(but.frame.origin.x, but.frame.origin.y+but.frame.size.height , window.frame.size.width, (window.frame.size.height-(but.frame.size.height+datePicker.frame.size.height)))style:UITableViewStyleGrouped];
//    //
//    //    UiTableView.dataSource = self;
//    //UiTableView.delegate = self;*/
//    return 0;
//}
@end
































/*
 You are attempting to retain something that is not an NSObject subclass. Usually this happens when someone tries to retain a float or int.
 
 NSInteger is a scalar and not an object. So you shouldn't retain it, it should be assigned. Changing your property will clear up the warning message. You don't need to do the NSNumber stuff that you added in.
 
 @property (nonatomic, assign) NSInteger integValue;
 */
