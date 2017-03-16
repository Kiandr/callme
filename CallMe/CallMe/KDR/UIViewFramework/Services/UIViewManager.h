//
//  UIViewManager.h
//  CallMe
//
//  Created by Kian Davoudi-Rad on 2017-03-16.
//  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
//

@interface UIViewManager : NSObject


// Main function available to viewController to deploy assets
-(void) buildAViewAndLoadIntoMainViewParameteizedAndDatePicker:(ViewController *) mainView;
@end
