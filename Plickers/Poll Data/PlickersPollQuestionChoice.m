//
//  PlickersPollQuestionChoice.m
//  Plickers
//
//  Created by Michael Selevan on 2/8/16.
//  Copyright © 2016 Michael Selevan. All rights reserved.
//

#import "PlickersPollQuestionChoice.h"

@implementation PlickersPollQuestionChoice

- (instancetype)initWithJson:(NSDictionary *)jsonObject choiceLetter:(NSString *)choiceLetter {
    if (self = [super init]) {
        _choiceLetter = choiceLetter;
        _correct = [jsonObject[@"correct"] boolValue];
        _body = jsonObject[@"body"];
    }
    
    return self;
}

@end
