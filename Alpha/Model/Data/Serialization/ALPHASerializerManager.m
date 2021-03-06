//
//  ALPHASerializerManager.m
//  Alpha
//
//  Created by Dal Rupnik on 03/06/15.
//  Copyright (c) 2015 Unified Sense. All rights reserved.
//

#import "ALPHASerializerManager.h"
#import "ALPHAJSONSerializer.h"

@implementation ALPHASerializerManager

#pragma mark - Singleton

+ (instancetype)sharedManager
{
    static ALPHASerializerManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[[self class] alloc] init];
    });
    return sharedManager;
}

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.serializer = [[ALPHAJSONSerializer alloc] init];
    }
    
    return self;
}

@end
