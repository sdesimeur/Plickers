//
//  PlickersPoll.h
//  Plickers
//
//  Created by Michael Selevan on 2/8/16.
//  Copyright © 2016 Michael Selevan. All rights reserved.
//

#import <Foundation/Foundation.h>


@class PlickersPollQuestion;


@interface PlickersPoll : NSObject

@property (nonatomic, readonly, strong) NSString *sectionId;
@property (nonatomic, readonly, strong) NSString *pollId;
@property (nonatomic, readonly, strong) NSDate *modified;
@property (nonatomic, readonly, strong) NSDate *created;
@property (nonatomic, readonly, strong) PlickersPollQuestion *question;
@property (nonatomic, readonly, strong) NSArray *responses;

- (instancetype)initWithJson:(NSDictionary *)jsonObject;

@end
