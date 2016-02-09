//
//  PlickersPollDataSource.m
//  Plickers
//
//  Created by Michael Selevan on 2/8/16.
//  Copyright © 2016 Michael Selevan. All rights reserved.
//

#import "PlickersPollDataSource.h"
#import "PlickersServerSource.h"
#import "PlickersServerApiCommandPoll.h"
#import "PlickersServerApiCommand+Factory.h"
#import "PlickersPollDataSourceDelegate.h"
#import "PlickersPoll.h"
#import "PlickersPollQuestionResponse.h"
#import "PlickersPollStudent.h"
#import "PlickersPollSection.h"


@interface PlickersPollDataSource ()

@property (nonatomic, readonly, strong) PlickersServerApiCommand *currentCommand;
@property (nonatomic, readonly, strong) NSArray *polls;
@property (nonatomic, readonly, strong) NSArray *sections;

@end

@implementation PlickersPollDataSource

#pragma mark PlickersServerApiCommandDelegate

- (void)apiCommand:(PlickersServerApiCommand *)command didFinishWithResults:(NSDictionary *)results {
    _polls = results[@"polls"];
    _currentCommand = nil;

    [self.dataSourceDelegate pollDataSourceDidFinishFetchingPollData:self];
}

#pragma mark Public Methods

- (void)fetchPollingDataFromSource:(id<PlickersServerSource>)source {
    if (!self.currentCommand) {
        _currentCommand = [PlickersServerApiCommand apiCommandForType:kPlickersServerApiCommandTypePoll forSource:source];
        self.currentCommand.commandDelegate = self;
        [self.currentCommand executeApiCommand];
    }
}

- (NSArray *)allPollData {
    return self.polls;
}

- (NSArray *)allStudentsDividedIntoSections {
    if (!self.sections && [self allPollData]) {
        NSMutableArray *sections = [NSMutableArray new];
        NSMutableDictionary *sectionIdToSection = [NSMutableDictionary new];
        NSMutableDictionary *studentEmailAddressToStudent = [NSMutableDictionary new];
        for (PlickersPoll *poll in [self allPollData]) {
            PlickersPollSection *section = [sectionIdToSection objectForKey:poll.sectionId];
            if (!section) {
                section = [[PlickersPollSection alloc] initWithSectionId:poll.sectionId];
                [sectionIdToSection setObject:section forKey:poll.sectionId];
                [sections addObject:section];
            }

            for (PlickersPollQuestionResponse *response in poll.responses) {
                PlickersPollStudent *student = [studentEmailAddressToStudent objectForKey:response.student];
                if (!student) {
                    student = [[PlickersPollStudent alloc] initWithStudentEmail:response.student];
                    [studentEmailAddressToStudent setObject:student forKey:response.student];
                    [section addStudent:student];
                }

                [student addResponse:response toQuestion:poll.question];
            }
        }

        _sections = sections;
    }

    return self.sections;
}

#pragma mark Private Methods

@end
