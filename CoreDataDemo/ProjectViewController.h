//
//  ProjectViewController.h
//  CoreDataDemo
//
//  Created by leo on 16/1/28.
//  Copyright © 2016年 leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class Project;

@interface ProjectViewController : UIViewController

@property (nonatomic, strong) Project *project;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *url;


- (id)initWithProject:(Project *)project fetchedResultsController:(NSFetchedResultsController *)fetchedResultsController;
- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;


@end
