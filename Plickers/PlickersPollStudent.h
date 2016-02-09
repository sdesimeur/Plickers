//
// Created by Michael Selevan on 2/9/16.
// Copyright (c) 2016 Michael Selevan. All rights reserved.
//

#import <Foundation/Foundation.h>


@class PlickersPollQuestionResponse;
@class PlickersPollQuestion;


@interface PlickersPollStudent : NSObject

@property (nonatomic, readonly, strong) NSString *email;
@property (nonatomic, readonly, strong) NSArray *studentResponses;
@property (nonatomic, readwrite) NSInteger cardId;

- (instancetype)initWithStudentEmail:(NSString *)email;

- (void)addResponse:(PlickersPollQuestionResponse *)response toQuestion:(PlickersPollQuestion *)question;

@end