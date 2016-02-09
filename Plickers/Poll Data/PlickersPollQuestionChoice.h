//
//  PlickersPollQuestionChoice.h
//  Plickers
//
//  Created by Michael Selevan on 2/8/16.
//  Copyright © 2016 Michael Selevan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlickersPollQuestionChoice : NSObject

@property (nonatomic, readonly, strong) NSString *choiceLetter;
@property (nonatomic, readonly, strong) NSString *body;
@property (nonatomic, readonly) BOOL correct;

- (instancetype)initWithJson:(NSDictionary *)jsonObject choiceLetter:(NSString *)choiceLetter;

@end
