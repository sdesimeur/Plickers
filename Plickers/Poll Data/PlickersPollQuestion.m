//
//  PlickersPollQuestion.m
//  Plickers
//
//  Created by Michael Selevan on 2/8/16.
//  Copyright © 2016 Michael Selevan. All rights reserved.
//

#import "PlickersPollQuestion.h"
#import "PlickersPollQuestionChoice.h"


@interface PlickersPollQuestion () {
    NSMutableArray *_choices;
}

@end

@implementation PlickersPollQuestion

- (instancetype)initWithJson:(NSDictionary *)jsonObject {
    if (self = [super init]) {
        _questionId = jsonObject[@"id"];
        _body = jsonObject[@"body"];
        _imageUrl = jsonObject[@"image"];
        
        NSError *error;
        NSDataDetector *data = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeDate error:&error];
        
        _modified = [data firstMatchInString:jsonObject[@"modified"]
                                     options:NSMatchingReportCompletion
                                       range:NSMakeRange(0, [jsonObject[@"modified"] length])].date;
        
        _created = [data firstMatchInString:jsonObject[@"created"]
                                    options:NSMatchingReportCompletion
                                      range:NSMakeRange(0, [jsonObject[@"created"] length])].date;

        _choices = [NSMutableArray new];

        char choiceLetter = 'A';
        for (NSDictionary *choiceJson in jsonObject[@"choices"]) {
            PlickersPollQuestionChoice *choice = [[PlickersPollQuestionChoice alloc] initWithJson:choiceJson choiceLetter:[NSString stringWithFormat:@"%c", choiceLetter]];
            [_choices addObject:choice];
            choiceLetter++;
        }
    }
    
    return self;
}

@end
