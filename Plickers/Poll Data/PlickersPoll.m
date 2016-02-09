//
//  PlickersPoll.m
//  Plickers
//
//  Created by Michael Selevan on 2/8/16.
//  Copyright © 2016 Michael Selevan. All rights reserved.
//

#import "PlickersPoll.h"
#import "PlickersPollQuestion.h"
#import "PlickersPollQuestionResponse.h"


@interface PlickersPoll () {
    NSMutableArray *_responses;
}

@end

@implementation PlickersPoll

- (instancetype)initWithJson:(NSDictionary *)jsonObject {
    if (self = [super init]) {
        _sectionId = jsonObject[@"section"];
        _pollId = jsonObject[@"id"];
        
        NSError *error;
        NSDataDetector *data = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeDate error:&error];
        
        _modified = [data firstMatchInString:jsonObject[@"modified"]
                                        options:NSMatchingReportCompletion
                                          range:NSMakeRange(0, [jsonObject[@"modified"] length])].date;
        
        _created = [data firstMatchInString:jsonObject[@"created"]
                                     options:NSMatchingReportCompletion
                                       range:NSMakeRange(0, [jsonObject[@"created"] length])].date;

        _question = [[PlickersPollQuestion alloc] initWithJson:jsonObject[@"question"]];

        _responses = [NSMutableArray new];

        for (NSDictionary *responseJson in jsonObject[@"responses"]) {
            PlickersPollQuestionResponse *response = [[PlickersPollQuestionResponse alloc] initWithJson:responseJson];
            [_responses addObject:response];
        }
    }
    
    return self;
}

@end
