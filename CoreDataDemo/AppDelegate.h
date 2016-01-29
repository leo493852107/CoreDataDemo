//
//  AppDelegate.h
//  CoreDataDemo
//
//  Created by leo on 16/1/27.
//  Copyright © 2016年 leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)saveContext;

@end

