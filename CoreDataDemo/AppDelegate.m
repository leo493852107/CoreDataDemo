//
//  AppDelegate.m
//  CoreDataDemo
//
//  Created by leo on 16/1/27.
//  Copyright © 2016年 leo. All rights reserved.
//

#import "AppDelegate.h"
#import "ContextSetup.h"
#import "MasterViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) ContextSetup *contextSetup;

@property (nonatomic, strong) NSManagedObjectContext *databaseContext;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
    MasterViewController *controller = (MasterViewController *)navigationController.topViewController;
    self.contextSetup = [[ContextSetup alloc] initWithStoreURL:self.storeURL modelURL:self.modelURL];
    self.databaseContext = self.contextSetup.managedObjectContext;
    controller.managedObjectContext = self.databaseContext;
    application.applicationSupportsShakeToEdit = YES;
    
    return YES;
}

// save
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    [self saveContext];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self saveContext];
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.databaseContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

- (NSURL *)storeURL {
    NSURL *documentsDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:NULL];
    
    NSLog(@"路径-%@", [documentsDirectory URLByAppendingPathComponent:@"db.sqlite"]);
    
    return [documentsDirectory URLByAppendingPathComponent:@"db.sqlite"];
    
}

- (NSURL *)modelURL {
    return [[NSBundle mainBundle] URLForResource:@"CoreDump" withExtension:@"momd"];
}


@end
