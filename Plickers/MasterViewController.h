//
//  MasterViewController.h
//  Plickers
//
//  Created by Michael Selevan on 2/8/16.
//  Copyright © 2016 Michael Selevan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlickersPollDataSourceDelegate.h"


@class DetailViewController;

@interface MasterViewController : UITableViewController <PlickersPollDataSourceDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;


@end

