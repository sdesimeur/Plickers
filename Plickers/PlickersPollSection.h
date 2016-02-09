//
// Created by Michael Selevan on 2/9/16.
// Copyright (c) 2016 Michael Selevan. All rights reserved.
//

#import <Foundation/Foundation.h>


@class PlickersPollStudent;


@interface PlickersPollSection : NSObject

@property (nonatomic, readonly, strong) NSString *sectionId;
@property (nonatomic, readonly, strong) NSArray *students;

- (instancetype)initWithSectionId:(NSString *)sectionId;

- (void)addStudent:(PlickersPollStudent *)student;

- (NSArray *)sortedStudents;

@end