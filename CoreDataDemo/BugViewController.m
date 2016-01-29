//
//  BugViewController.m
//  CoreDataDemo
//
//  Created by leo on 16/1/29.
//  Copyright © 2016年 leo. All rights reserved.
//

#import "BugViewController.h"
#import "Bug.h"
#import "Project.h"

@interface BugViewController ()

@end

@implementation BugViewController

- (id)initWithBug:(Bug *)bug project:(Project *)project {
    self = [super init];
    if (self) {
        self.bug = bug;
        self.project = project;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.bug != nil) {
        self.bugTitle.text = self.bug.title;
        self.details.text = self.bug.details;
        self.screenshot.image = [UIImage imageWithData:self.bug.screenshot];
    } else {
        self.details.text = @"";
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.screenshot.layer.borderColor = [UIColor blackColor].CGColor;
    self.screenshot.layer.borderWidth = 1.0f;
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(screenShotTapped:)];
    [self.screenshot addGestureRecognizer:tapGestureRecognizer];
    
}

- (void)screenShotTapped:(id)sender {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.allowsEditing = YES;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}


- (IBAction)save:(id)sender {
    if (self.bug == nil) {
        self.bug = [NSEntityDescription insertNewObjectForEntityForName:@"Bug" inManagedObjectContext:self.project.managedObjectContext];
    }
    
    self.bug.project = self.project;
    self.bug.title = self.bugTitle.text;
    self.bug.details = self.details.text;
    self.bug.screenshot = UIImagePNGRepresentation(self.screenshot.image);
    
    // Save the context.
    NSError *error = nil;
    if (![self.project.managedObjectContext save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Image picker 
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [self dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = info[UIImagePickerControllerEditedImage];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.screenshot.image = image;
    });
}

@end
