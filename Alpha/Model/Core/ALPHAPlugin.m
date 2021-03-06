//
//  FLEXPlugin.m
//  UICatalog
//
//  Created by Dal Rupnik on 19/11/14.
//  Copyright (c) 2014 f. All rights reserved.
//

#import "ALPHAPlugin.h"

@interface ALPHAPlugin ()

@property (nonatomic, strong, readwrite) NSString* identifier;
@property (nonatomic, strong) NSMutableOrderedSet* baseActions;
@property (nonatomic, strong) NSMutableOrderedSet* baseCollectors;

@end

@implementation ALPHAPlugin

#pragma mark - Getters and Setters

- (NSString *)title
{
    NSString* classString = NSStringFromClass([self class]);
    
    classString = [classString stringByReplacingOccurrencesOfString:@"ALPHA" withString:@""];
    
    // Backwards compatibility, remove later.
    classString = [classString stringByReplacingOccurrencesOfString:@"FLEX" withString:@""];
    classString = [classString stringByReplacingOccurrencesOfString:@"Plugin" withString:@""];
    
    return classString;
}

- (NSMutableOrderedSet *)baseActions
{
    if (!_baseActions)
    {
        _baseActions = [NSMutableOrderedSet orderedSet];
    }
    
    return _baseActions;
}

- (NSMutableOrderedSet *)baseCollectors
{
    if (!_baseCollectors)
    {
        _baseCollectors = [NSMutableOrderedSet orderedSet];
    }
    
    return _baseCollectors;
}

- (NSArray *)actions
{
    return [self.baseActions array];
}

- (NSArray *)collectors
{
    return [self.baseCollectors array];
}

- (void)setEnabled:(BOOL)enabled
{
    _enabled = enabled;
    
    //
    // If plugin is disabled, all collectors will be disabled too
    //
    
    for (ALPHADataCollector* collector in self.baseCollectors)
    {
        collector.enabled = enabled;
    }
}

#pragma mark - Initialization

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Identifier missing." reason:@"Plugin requires identifier to be defined." userInfo:nil];
}

- (instancetype)initWithIdentifier:(NSString *)identifier
{
    self = [super init];
    
    if (self)
    {
        self.enabled = YES;
        self.identifier = identifier;
    }
    
    return self;
}

- (BOOL)shouldHandleTouchAtPoint:(CGPoint)pointInWindow
{
    return NO;
}

- (void)registerAction:(ALPHAActionItem *)action
{
    for (ALPHAActionItem* actionItem in self.baseActions)
    {
        if ([actionItem.identifier isEqualToString:action.identifier])
        {
            @throw [NSException exceptionWithName:@"Action equal identifiers" reason:@"Actions must have unique identifiers" userInfo:@{ @"action" : action }];
        }
    }
    
    [self.baseActions addObject:action];
}

- (void)registerCollector:(ALPHADataCollector *)collector
{
    [self.baseCollectors addObject:collector];
}

@end
