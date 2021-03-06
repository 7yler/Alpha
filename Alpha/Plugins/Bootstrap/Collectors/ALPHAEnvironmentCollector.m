//
//  ALPHAEnvironmentCollector.m
//  Alpha
//
//  Created by Dal Rupnik on 05/06/15.
//  Copyright (c) 2015 Unified Sense. All rights reserved.
//

#import "ALPHAEnvironmentCollector.h"
#import "ALPHAScreenModel.h"
#import "ALPHAActions.h"

NSString *const ALPHAEnvironmentDataIdentifier = @"com.unifiedsense.alpha.data.environment";

@interface ALPHAEnvironmentCollector ()

@property (nonatomic, copy) NSString *currentEnvironment;
@property (nonatomic, copy) NSArray *environments;

@end

@implementation ALPHAEnvironmentCollector

#pragma mark - Getters and Setters

- (Class)bootstrap
{
    return NSClassFromString(@"KZBootstrap");
}

- (NSArray *)environments
{
    if (!_environments)
    {
        Class bootstrap = [self bootstrap];
        
        if (bootstrap)
        {
            SEL environments = NSSelectorFromString(@"environments");
            
            if ([bootstrap respondsToSelector:environments])
            {
                #pragma clang diagnostic push
                #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                
                _environments = [bootstrap performSelector:environments];
                
                #pragma clang diagnostic pop
            }
        }
    }
    
    return _environments;
}
    
- (NSString *)currentEnvironment
{
    Class bootstrap = [self bootstrap];
    
    if (bootstrap)
    {
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"

        SEL currentEnvironment = NSSelectorFromString(@"currentEnvironment");
        
        if ([bootstrap respondsToSelector:currentEnvironment])
        {
            return [bootstrap performSelector:currentEnvironment];
        }
        
        #pragma clang diagnostic pop
    }

    return nil;
}

- (void)setCurrentEnvironment:(NSString *)currentEnvironment
{
    Class bootstrap = [self bootstrap];
    
    if (bootstrap)
    {
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                
        SEL setCurrentEnvironment = NSSelectorFromString(@"setCurrentEnvironment:");
        
        if ([bootstrap respondsToSelector:setCurrentEnvironment])
        {
            [bootstrap performSelector:setCurrentEnvironment withObject:currentEnvironment];
        }
        
        #pragma clang diagnostic pop
    }
}

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        [self addDataIdentifier:ALPHAEnvironmentDataIdentifier];
        [self addActionIdentifier:[ALPHAEnvironmentDataIdentifier stringByAppendingString:@".setEnvironment"]];
    }
    
    return self;
}

- (ALPHAModel *)model
{
    ALPHAScreenModel* screenModel = [[ALPHAScreenModel alloc] initWithIdentifier:ALPHAEnvironmentDataIdentifier];
    screenModel.title = @"Environments";
    
    ALPHAScreenSection* section = [[ALPHAScreenSection alloc] init];
    
    NSMutableArray* items = [NSMutableArray array];
    
    for (NSString* environment in self.environments)
    {
        ALPHASelectorActionItem* item = [[ALPHASelectorActionItem alloc] initWithIdentifier:[ALPHAEnvironmentDataIdentifier stringByAppendingString:@".setEnvironment"]];
        item.title = environment;
        item.model = environment;
        
        if ([environment isEqualToString:self.currentEnvironment])
        {
            item.accessory = UITableViewCellAccessoryCheckmark;
        }
        
        [items addObject:item];
    }
    
    section.items = items;
    
    screenModel.sections = @[ section ];
    
    return screenModel;

}

@end
