//
//  ContextSetup.h
//  CoreDataDemo
//
//  Created by leo on 16/1/28.
//  Copyright © 2016年 leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface ContextSetup : NSObject

- (id)initWithStoreURL:(NSURL *)storeURL modelURL:(NSURL *)modelURL;

@property (nonatomic,strong,readonly) NSManagedObjectContext* managedObjectContext;

@end
