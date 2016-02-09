//
//  AppMesh
//
//  Created by mselevan on 2/8/16.
//  Copyright (c) 2012 AppMesh. All rights reserved.
//


#import "PlickersServerApiCommand+Factory.h"
#import "PlickersServerApiCommandPoll.h"


@implementation PlickersServerApiCommand (Factory)

+ (PlickersServerApiCommand *)apiCommandForType:(PlickersServerApiCommandType)commandType forSource:(id<PlickersServerSource>)serverSource {
    PlickersServerApiCommand *command = nil;
    switch (commandType) {
        case kPlickersServerApiCommandTypePoll:
            command = [PlickersServerApiCommandPoll alloc];
        default:
            break;
    }

    [command initApiCommandForSource:serverSource];

    return command;
}

@end