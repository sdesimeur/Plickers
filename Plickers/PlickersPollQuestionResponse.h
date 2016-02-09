//
// Created by Michael Selevan on 2/8/16.
// Copyright (c) 2016 Michael Selevan. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PlickersPollQuestionResponse : NSObject

@property (nonatomic, readonly, strong) NSString *student;
@property (nonatomic, readonly, strong) NSString *answer;
@property (nonatomic, readonly, strong) NSString *card;

- (instancetype)initWithJson:(NSDictionary *)jsonObject;

@end