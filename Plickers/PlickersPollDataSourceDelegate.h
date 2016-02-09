//
// Created by Michael Selevan on 2/8/16.
// Copyright (c) 2016 Michael Selevan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PlickersPollDataSource;

@protocol PlickersPollDataSourceDelegate <NSObject>

- (void)pollDataSourceDidFinishFetchingPollData:(PlickersPollDataSource *)dataSource;

@end