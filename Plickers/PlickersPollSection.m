//
//  AppMesh
//
//  Created by mselevan on 2/9/16.
//  Copyright (c) 2012 AppMesh. All rights reserved.
//


#import "PlickersPollSection.h"
#import "PlickersPollStudent.h"


@interface PlickersPollSection () {
    NSMutableArray *_students;
}

@property (nonatomic, readwrite) BOOL sorted;

@end


@implementation PlickersPollSection

- (instancetype)initWithSectionId:(NSString *)sectionId {
    if (self = [super init]) {
        _sectionId = sectionId;
        _students = [NSMutableArray new];
        self.sorted = false;
    }

    return self;
}

- (void)addStudent:(PlickersPollStudent *)student {
    [_students addObject:student];
    self.sorted = false;
}

- (NSArray *)sortedStudents {
    if (!self.sorted) {
        NSSortDescriptor *emailSort = [[NSSortDescriptor alloc] initWithKey:@"email" ascending:true];
        [_students sortUsingDescriptors:@[emailSort]];
        self.sorted = true;
    }

    return self.students;
}

@end