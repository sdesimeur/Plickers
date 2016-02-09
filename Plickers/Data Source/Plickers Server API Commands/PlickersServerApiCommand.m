//
//  PlickersServerApiCommand.m
//  Plickers
//
//  Created by Michael Selevan on 2/8/16.
//  Copyright © 2016 Michael Selevan. All rights reserved.
//

#import "PlickersServerApiCommand.h"
#import "PlickersServerSource.h"

@interface PlickersServerApiCommand ()

@property (nonatomic, readonly, strong) NSURLSession *apiCommandSession;
@property (nonatomic, readonly, strong) NSURLSessionDataTask *apiDataTask;
@property (nonatomic, readonly, strong) id<PlickersServerSource> serverSource;

@end

@implementation PlickersServerApiCommand

- (instancetype)initApiCommandForSource:(id<PlickersServerSource>)serverSource {
    if (self = [super init]) {
        _serverSource = serverSource;
    }
    
    return self;
}

#pragma mark Public Methods

- (void)executeApiCommand {
    [self.serverSource performPlickersApiCommand:self];
}

- (void)receivedData:(NSData *)data {
    
}

- (PlickersServerApiCommandType)commandType {
    @throw [NSException exceptionWithName:@"unimplemented method" reason:@"subclass needs to implement commandType" userInfo:nil];
}

- (NSDictionary *)commandParameters {
    @throw [NSException exceptionWithName:@"unimplemented method" reason:@"subclass needs to implement commandParameters" userInfo:nil];
}

@end
