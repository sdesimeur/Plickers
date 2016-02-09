//
//  PlickersServerApiCommandPoll.m
//  Plickers
//
//  Created by Michael Selevan on 2/8/16.
//  Copyright © 2016 Michael Selevan. All rights reserved.
//

#import "PlickersServerApiCommandPoll.h"
#import "PlickersPoll.h"
#import "PlickersServerApiCommandDelegate.h"


@implementation PlickersServerApiCommandPoll

#pragma mark Implement Methods

- (PlickersServerApiCommandType)commandType {
    return kPlickersServerApiCommandTypePoll;
}

- (NSDictionary *)commandParameters {
    return nil;
}

- (void)receivedData:(NSData *)data {
    NSError *errorMessage;
    NSArray *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&errorMessage];
    if (!errorMessage) {
        NSMutableArray *polls = [NSMutableArray new];
        for (NSDictionary *jsonPollObject in jsonObject) {
            PlickersPoll *poll = [[PlickersPoll alloc] initWithJson:jsonPollObject];

            [polls addObject:poll];
        }

        __weak PlickersServerApiCommandPoll *weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.commandDelegate apiCommand:self didFinishWithResults:@{@"polls" : polls}];
        });
    }
}

@end
