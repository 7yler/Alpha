//
//  ALPHABaseSource.m
//  UICatalog
//
//  Created by Dal Rupnik on 29/05/15.
//  Copyright (c) 2015 Unified Sense. All rights reserved.
//

#import "ALPHABaseSource.h"

@implementation ALPHABaseSource

- (void)refreshWithIdentifier:(NSString *)identifier completion:(ALPHADataSourceCompletion)completion
{
    if (identifier.length)
    {
        [self refreshWithIdentifiers:@[ identifier ] completion:completion];
    }
    else
    {
        [self refreshWithIdentifiers:nil completion:completion];
    }
}

- (void)refreshWithIdentifiers:(NSArray *)identifiers completion:(ALPHADataSourceCompletion)completion
{
    if (completion)
    {
        completion(nil, nil);
    }
}

- (void)performActionWithIdentifier:(NSString *)identifier completion:(ALPHADataSourceCompletion)completion
{
    if (identifier.length)
    {
        [self performActionsWithIdentifiers:@[ identifier ] completion:completion];
    }
    else
    {
        [self performActionsWithIdentifiers:nil completion:completion];
    }
}

- (void)performActionsWithIdentifiers:(NSArray *)identifiers completion:(ALPHADataSourceCompletion)completion
{
    if (completion)
    {
        completion(nil, nil);
    }
}

@end
