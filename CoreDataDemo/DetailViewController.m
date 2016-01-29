//
//  DetailViewController.m
//  CoreDataDemo
//
//  Created by leo on 16/1/29.
//  Copyright © 2016年 leo. All rights reserved.
//

#import "DetailViewController.h"
#import "Project.h"
#import "Bug.h"
#import "BugViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = self.project.name;
    [self.tableView reloadData];
}

- (IBAction)insertNewObject:(UIBarButtonItem *)sender {
    BugViewController *bugViewController = [[BugViewController alloc] initWithBug:nil project:self.project];
    [self presentViewController:bugViewController animated:YES completion:nil];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.project.bugs count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell" forIndexPath:indexPath];
    
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    Bug *bug = [self sortedBugs][indexPath.row];
    BugViewController *bugViewController = [[BugViewController alloc] initWithBug:bug project:self.project];
    [self presentViewController:bugViewController animated:YES completion:nil];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    Bug *bug = [self sortedBugs][indexPath.row];
    cell.textLabel.text = bug.title;
}

- (NSArray *)sortedBugs {
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
    return [self.project.bugs sortedArrayUsingDescriptors:@[sortDescriptor]];
}


@end
