//
//  BugViewController.h
//  CoreDataDemo
//
//  Created by leo on 16/1/29.
//  Copyright © 2016年 leo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Bug;
@class Project;

@interface BugViewController : UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic, strong) Bug *bug;
@property (nonatomic, strong) Project *project;


@property (weak, nonatomic) IBOutlet UITextField *bugTitle;
@property (weak, nonatomic) IBOutlet UITextView *details;

@property (weak, nonatomic) IBOutlet UIImageView *screenshot;



- (id)initWithBug:(Bug *)bug project:(Project *)project;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;


@end
