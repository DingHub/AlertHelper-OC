//
//  ViewController.m
//  AlertHelper
//
//  Created by admin on 16/7/20.
//  Copyright © 2016年 Ding. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+BlockAlert.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)showAlertView:(id)sender {
    
    [self showAlertViewWithTitle:@"Title"
                         message:@"Message"
          destructiveButtonTitle:@"destructive"
               cancelButtonTitle:@"cancel"
               otherButtonTitles:@[@"boy",@"girl"]
             buttonTappedHandler:^(NSInteger buttonIndex) {
                 NSLog(@"%zd", buttonIndex);
             }];
}

- (IBAction)showActionSheet:(id)sender {
    
    [self showActionSheetWithTitle:@"Title"
                           message:@"Message"
            destructiveButtonTitle:@"destructive"
                 cancelButtonTitle:@"cancel"
                 otherButtonTitles:@[@"boy",@"girl"]
               buttonTappedHandler:^(NSInteger buttonIndex) {
                   NSLog(@"%zd", buttonIndex);
               }];
}

@end
