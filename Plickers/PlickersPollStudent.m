//
//  AppMesh
//
//  Created by mselevan on 2/9/16.
//  Copyright (c) 2012 AppMesh. All rights reserved.
//


#import "PlickersPollStudent.h"
#import "PlickersPollQuestionResponse.h"
#import "PlickersPollQuestion.h"
#import "PlickersPollStudentResponse.h"


@interface PlickersPollStudent () {
    NSMutableArray *_studentResponses;
}

@end


@implementation PlickersPollStudent

- (instancetype)initWithStudentEmail:(NSString *)email {
    if (self = [super init]) {
        _studentResponses = [NSMutableArray new];
        _email = email;
    }

    return self;
}

#pragma mark Public Methods

- (void)addResponse:(PlickersPollQuestionResponse *)response toQuestion:(PlickersPollQuestion *)question {
    PlickersPollStudentResponse *studentResponse = [[PlickersPollStudentResponse alloc] initWithQuestion:question response:response];
    [_studentResponses addObject:studentResponse];
}

@end