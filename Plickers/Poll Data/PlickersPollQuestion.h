//
//  PlickersPollQuestion.h
//  Plickers
//
//  Created by Michael Selevan on 2/8/16.
//  Copyright © 2016 Michael Selevan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlickersPollQuestion : NSObject

@property (nonatomic, readonly, strong) NSString *questionId;
@property (nonatomic, readonly, strong) NSDate *modified;
@property (nonatomic, readonly, strong) NSDate *created;
@property (nonatomic, readonly, strong) NSString *body;
@property (nonatomic, readonly, strong) NSString *imageUrl;

@property (nonatomic, readonly, strong) NSArray *choices;
//@property (nonatomic, readonly, strong) NSDictionary *correctChoices;
//@property (nonatomic, readonly, strong) NSDictionary *incorrectChoices;

@property (nonatomic, readonly, strong) NSData *cachedImageData;

- (instancetype)initWithJson:(NSDictionary *)jsonObject;

@end
