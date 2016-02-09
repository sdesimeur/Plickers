//
//  PlickersServerApiCommand.h
//  Plickers
//
//  Created by Michael Selevan on 2/8/16.
//  Copyright © 2016 Michael Selevan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PlickersServerSource;
@protocol PlickersServerApiCommandDelegate;

typedef NS_ENUM(NSUInteger, PlickersServerApiCommandType) {
    kPlickersServerApiCommandTypePoll
};

@interface PlickersServerApiCommand : NSObject

@property (nonatomic, readwrite, weak) id<PlickersServerApiCommandDelegate> commandDelegate;

- (instancetype)initApiCommandForSource:(id<PlickersServerSource>)serverSource;

- (void)executeApiCommand;

- (void)receivedData:(NSData *)data;

- (PlickersServerApiCommandType)commandType;

- (NSDictionary *)commandParameters;

@end
