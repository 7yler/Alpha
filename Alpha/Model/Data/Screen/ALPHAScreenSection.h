//
//  ALPHAScreenSection.h
//  Alpha
//
//  Created by Dal Rupnik on 20/05/15.
//  Copyright (c) 2015 Unified Sense. All rights reserved.
//

#import "ALPHASerializableItem.h"

@interface ALPHAScreenSection : NSObject <ALPHASerializableItem>

@property (nonatomic, copy) NSString* identifier;

@property (nonatomic, copy) NSString* title;

//
// Array of Display Item objects
//
@property (nonatomic, copy) NSArray* items;

- (instancetype)initWithIdentifier:(NSString *)identifier;
- (instancetype)initWithIdentifier:(NSString *)identifier title:(NSString *)title;

/*!
 *  Dictionary should be structured with a special DSL (see example). Supports NSDictionary
 *  for items or already created screen item objects - dictionary will be converted into objects.
 *
 *  @param dictionary of described data section
 *
 *  @return instantiated section
 */
+ (instancetype)screenSectionWithDictionary:(NSDictionary *)dictionary;

@end
