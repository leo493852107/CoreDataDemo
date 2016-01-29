//
//  MasterViewController.h
//  CoreDataDemo
//
//  Created by leo on 16/1/28.
//  Copyright © 2016年 leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate, UISearchResultsUpdating>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

//从AppleDelegate得到
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) NSPredicate *searchPredicate;

@end
