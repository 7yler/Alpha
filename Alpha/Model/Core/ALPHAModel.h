//
//  ALPHAModel.h
//  Alpha
//
//  Created by Dal Rupnik on 02/06/15.
//  Copyright (c) 2015 Unified Sense. All rights reserved.
//

#import "ALPHASerializableItem.h"

@interface ALPHAModel : NSObject <ALPHASerializableItem>

@property (nonatomic, copy) NSString* identifier;

- (instancetype)initWithIdentifier:(NSString *)identifier;

@end
