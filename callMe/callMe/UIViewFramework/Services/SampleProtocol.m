//
//  SampleProtocol.m
//  callMe
//
//  Created by Kian Davoudi-Rad on 2017-03-15.
//  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
//

#import "SampleProtocol.h"

@implementation SampleProtocol

-(void)startSampleProcess{
    
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self.delegate
                                   selector:@selector(processCompleted) userInfo:nil repeats:NO];
}
@end
