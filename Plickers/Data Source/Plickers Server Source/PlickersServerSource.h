//
//  PlickersServerSource.h
//  Plickers
//
//  Created by Michael Selevan on 2/8/16.
//  Copyright © 2016 Michael Selevan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PlickersServerApiCommand;

@protocol PlickersServerSource <NSObject>

- (void)performPlickersApiCommand:(PlickersServerApiCommand *)command;

@end
