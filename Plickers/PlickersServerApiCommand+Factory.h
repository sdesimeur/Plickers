//
// Created by Michael Selevan on 2/8/16.
// Copyright (c) 2016 Michael Selevan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlickersServerApiCommand.h"


@interface PlickersServerApiCommand (Factory)

+ (PlickersServerApiCommand *)apiCommandForType:(PlickersServerApiCommandType)commandType forSource:(id<PlickersServerSource>)serverSource;

@end