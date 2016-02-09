//
//  MasterViewController.m
//  Plickers
//
//  Created by Michael Selevan on 2/8/16.
//  Copyright © 2016 Michael Selevan. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "PlickersPollDataSource.h"
#import "PlickersServerSourceInterview.h"
#import "PlickersPollSection.h"
#import "PlickersPollStudent.h"
#import "PlickersStudentTableViewCell.h"


@interface MasterViewController ()

@property NSMutableArray *objects;
@property (nonatomic, readonly, strong) PlickersPollDataSource *plickersDataSource;
@property (nonatomic, readonly, strong) PlickersServerSourceInterview *interviewServerSource;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];

    _plickersDataSource = [[PlickersPollDataSource alloc] init];
    self.plickersDataSource.dataSourceDelegate = self;
    _interviewServerSource = [[PlickersServerSourceInterview alloc] init];
    [self.plickersDataSource fetchPollingDataFromSource:self.interviewServerSource];
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark PlickersPollDataSourceDelegate

- (void)pollDataSourceDidFinishFetchingPollData:(PlickersPollDataSource *)dataSource {
    [self.tableView reloadData];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.plickersDataSource allStudentsDividedIntoSections].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[[self.plickersDataSource allStudentsDividedIntoSections] objectAtIndex:section] sortedStudents] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlickersStudentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    PlickersPollStudent *student = [[[[self.plickersDataSource allStudentsDividedIntoSections] objectAtIndex:indexPath.section] sortedStudents] objectAtIndex:indexPath.row];
    [cell updateCellWithStudent:student];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"Section %i", section+1];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

@end
