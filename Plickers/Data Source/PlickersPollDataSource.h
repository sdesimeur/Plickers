//
//  PlickersPollDataSource.h
//  Plickers
//
//  Created by Michael Selevan on 2/8/16.
//  Copyright © 2016 Michael Selevan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlickersServerApiCommandDelegate.h"


@protocol PlickersServerSource;
@protocol PlickersPollDataSourceDelegate;


@interface PlickersPollDataSource : NSObject <PlickersServerApiCommandDelegate>

@property (nonatomic, readwrite, weak) id<PlickersPollDataSourceDelegate> dataSourceDelegate;

- (void)fetchPollingDataFromSource:(id<PlickersServerSource>)source;

- (NSArray *)allPollData;

- (NSArray *)allStudentsDividedIntoSections;

@end
