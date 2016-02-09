//
//  AppMesh
//
//  Created by mselevan on 2/9/16.
//  Copyright (c) 2012 AppMesh. All rights reserved.
//


#import "PlickersStudentTableViewCell.h"
#import "PlickersPollStudent.h"
#import "PlickersPollStudentResponse.h"


@interface PlickersStudentTableViewCell ()

@end


@implementation PlickersStudentTableViewCell

- (void)updateCellWithStudent:(PlickersPollStudent *)student {
    self.textLabel.text = student.email;

    int correctResponses = 0;
    for (PlickersPollStudentResponse *studentResponse in student.studentResponses) {
        if (studentResponse.correct) {
            correctResponses++;
        }
    }

    NSMutableAttributedString *subtitleText = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%i out of %i correct", correctResponses, student.studentResponses.count]];

    CGFloat studentPercentage = 100*((CGFloat)correctResponses/(CGFloat)student.studentResponses.count);
    UIColor *gradeColor = nil;
    if (studentPercentage >= 87.5f) {
        gradeColor = [UIColor greenColor];
    } else if (studentPercentage >= 72.5f) {
        gradeColor = [UIColor orangeColor];
    } else {
        gradeColor = [UIColor redColor];
    }

    NSMutableAttributedString *percentageString = [[NSMutableAttributedString alloc]
            initWithString:[NSString stringWithFormat:@" (%%%.f)", studentPercentage]
            attributes:@{NSForegroundColorAttributeName : gradeColor}
    ];
    [subtitleText appendAttributedString:percentageString];

    self.detailTextLabel.attributedText = subtitleText;
}

@end