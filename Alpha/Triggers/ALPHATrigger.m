//
//  FLEXTrigger.m
//  UICatalog
//
//  Created by Dal Rupnik on 05/11/14.
//  Copyright (c) 2014 f. All rights reserved.
//

#import "ALPHAManager.h"
#import "ALPHATrigger.h"

@implementation ALPHATrigger

@synthesize enabled = _enabled;

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.enabled = YES;
    }
    
    return self;
}

- (void)trigger:(id)sender
{
    if (self.enabled)
    {
        [[ALPHAManager sharedManager] setInterfaceHidden:NO];
    }
}

@end
