//
//  AppMesh
//
//  Created by mselevan on 2/9/16.
//  Copyright (c) 2012 AppMesh. All rights reserved.
//


#import "PlickersPollStudentResponse.h"
#import "PlickersPollQuestion.h"
#import "PlickersPollQuestionResponse.h"


@implementation PlickersPollStudentResponse

- (instancetype)initWithQuestion:(PlickersPollQuestion *)question response:(PlickersPollQuestionResponse *)response {
    if (self = [super init]) {
        _question = question;
        _response = response;
    }

    return self;
}

@end