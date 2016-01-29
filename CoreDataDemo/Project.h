//
//  Project.h
//  CoreDataDemo
//
//  Created by leo on 16/1/28.
//  Copyright © 2016年 leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Bug;

@interface Project : NSManagedObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSSet *bugs;

@end

@interface Project (CoreDataGeneratedAccessors)

- (void)addBugsObject:(Bug *)value;
- (void)removeBugsObject:(Bug *)value;
- (void)addBugs:(NSSet *)values;
- (void)removeBugs:(NSSet *)values;

@end
