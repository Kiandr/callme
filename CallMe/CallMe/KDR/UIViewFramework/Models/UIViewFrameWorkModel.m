//
//  UIViewFrameWorkModel.m
//  CallMe
//
//  Created by Kian Davoudi-Rad on 2017-03-21.
//  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIViewFrameWorkModel.h"
@implementation UIViewFrameWorkModel : NSObject

- (id) initWithUIviewSize: (UIView*) uiViewScreen
{
    self = [super init];
    if (self)
    {
        // Superclass successfully initialized.
        self->_uiTableViewFrameOriginex = 0;
        self->_uiTableViewFrameOriginey = 0;
        
        CGFloat t_y = uiViewScreen.window.frame.size.height;
        self->_uiTableViewFrameSizeHeight   = 500;
        
        CGFloat t_w =  uiViewScreen.window.frame.size.width;
        self->_uiTableViewFrameSizeWidth = 300;
    }
    return self;
}

@end
































/*
 You are attempting to retain something that is not an NSObject subclass. Usually this happens when someone tries to retain a float or int.
 
 NSInteger is a scalar and not an object. So you shouldn't retain it, it should be assigned. Changing your property will clear up the warning message. You don't need to do the NSNumber stuff that you added in.
 
 @property (nonatomic, assign) NSInteger integValue;
 */
