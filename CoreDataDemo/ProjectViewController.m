//
//  ProjectViewController.m
//  CoreDataDemo
//
//  Created by leo on 16/1/28.
//  Copyright © 2016年 leo. All rights reserved.
//

#import "ProjectViewController.h"
#import "Project.h"

@interface ProjectViewController ()

@end

@implementation ProjectViewController

- (id)initWithProject:(Project *)project fetchedResultsController:(NSFetchedResultsController *)fetchedResultsController {
    self = [super init];
    if (self) {
        self.project = project;
        self.fetchedResultsController = fetchedResultsController;
    }
    return self;
}

- (IBAction)save:(id)sender {
    NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
    
    if (self.project == nil) {
        NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];

        self.project = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
    }
    
    self.project.name = self.name.text;
    self.project.url = self.url.text;
    
    // 保存操作
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.project != nil) {
        self.name.text = self.project.name;
        self.url.text = self.project.url;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
