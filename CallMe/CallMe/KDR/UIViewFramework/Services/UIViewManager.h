//
//  UIViewManager.h
//  CallMe
//
//  Created by Kian Davoudi-Rad on 2017-03-16.
//  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
//
#import<Foundation/Foundation.h>
#import "UIViewManagerProtocol.h"
@class UIViewManager;

@interface UIViewManager : NSObject
//{
//// LocalVar
//    id <UIViewManagerProtocol> delegate;
//}
//
//@property(nonatomic,assign) id<UIViewManagerProtocol> delegate;

// Main function available to viewController to deploy assets
- (id) init;
-(UIView*) buildAViewAndLoadIntoMainViewParameteizedAndDatePicker;
-(void)callBackFunctionFromButton:(NSString*) someInput;

@end
