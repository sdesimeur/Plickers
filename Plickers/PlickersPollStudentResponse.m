//
//  AppMesh
//
//  Created by mselevan on 2/9/16.
//  Copyright (c) 2012 AppMesh. All rights reserved.
//


#import "PlickersPollStudentResponse.h"
#import "PlickersPollQuestion.h"
#import "PlickersPollQuestionResponse.h"
#import "PlickersPollQuestionChoice.h"


@implementation PlickersPollStudentResponse

- (instancetype)initWithQuestion:(PlickersPollQuestion *)question response:(PlickersPollQuestionResponse *)response {
    if (self = [super init]) {
        _question = question;
        _response = response;

        for (PlickersPollQuestionChoice *choice in question.choices) {
            if ([choice.choiceLetter.lowercaseString isEqualToString:response.answer.lowercaseString]) {
                _correct = true;
                break;
            }
        }
    }

    return self;
}

@end