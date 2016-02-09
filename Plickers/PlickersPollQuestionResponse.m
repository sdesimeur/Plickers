//
//  AppMesh
//
//  Created by mselevan on 2/8/16.
//  Copyright (c) 2012 AppMesh. All rights reserved.
//


#import "PlickersPollQuestionResponse.h"



@implementation PlickersPollQuestionResponse

- (instancetype)initWithJson:(NSDictionary *)jsonObject {
    if (self = [super init]) {
        _student = jsonObject[@"student"];
        _answer = jsonObject[@"answer"];
        _card = jsonObject[@"card"];
    }

    return self;
}

@end