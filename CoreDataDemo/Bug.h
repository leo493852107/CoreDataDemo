//
//  Bug.h
//  CoreDataDemo
//
//  Created by leo on 16/1/28.
//  Copyright © 2016年 leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Project;

@interface Bug : NSManagedObject

@property (nonatomic, retain) NSString *details;
@property (nonatomic, retain) NSData *screenshot;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) Project *project;

@end
