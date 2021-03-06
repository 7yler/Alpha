//
//  FLEXNetworkConnection.h
//  UICatalog
//
//  Created by Dal Rupnik on 06/11/14.
//  Copyright (c) 2014 f. All rights reserved.
//

#import "ALPHASerializableItem.h"

#import "FLEXNetworkRequest.h"
#import "FLEXNetworkResponse.h"
#import "FLEXNetworkResourceTiming.h"
#import "FLEXNetworkError.h"

typedef enum : NSUInteger {
    FLEXNetworkConnectionTypeSession,
    FLEXNetworkConnectionTypeConnection,
} FLEXNetworkConnectionType;

@interface FLEXNetworkConnection : NSObject <ALPHASerializableItem>

@property (nonatomic, copy) NSString *requestID;

@property (nonatomic) FLEXNetworkConnectionType type;

@property (nonatomic, strong) FLEXNetworkRequest *request;
@property (nonatomic, strong) FLEXNetworkResponse *response;

// Timing information for the given request.
@property (nonatomic, strong) FLEXNetworkResourceTiming *timing;

@property (nonatomic, strong) FLEXNetworkError *error;

@property (nonatomic, strong) NSString *responseString;
//@property (nonatomic, strong) id responseObject;

@property (nonatomic, strong) NSNumber *size;

- (void)updateWithRequest:(FLEXNetworkRequest *)request withResponse:(FLEXNetworkResponse *)response;

@end
