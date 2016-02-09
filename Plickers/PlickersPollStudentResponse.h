//
// Created by Michael Selevan on 2/9/16.
// Copyright (c) 2016 Michael Selevan. All rights reserved.
//

#import <Foundation/Foundation.h>


@class PlickersPollQuestion;
@class PlickersPollQuestionResponse;


@interface PlickersPollStudentResponse : NSObject

@property (nonatomic, readonly, strong) PlickersPollQuestion *question;
@property (nonatomic, readonly, strong) PlickersPollQuestionResponse *response;
@property (nonatomic, readonly) BOOL correct;

- (instancetype)initWithQuestion:(PlickersPollQuestion *)question response:(PlickersPollQuestionResponse *)response;

@end