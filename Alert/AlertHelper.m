//
//  AlertHelper.m
//  iOSProjectFrame
//
//  Created by admin on 16/7/20.
//  Copyright © 2016年 Ding. All rights reserved.
//

#import "AlertHelper.h"
#import "UIAlertView+block.h"
#import "UIActionSheet+block.h"
#import "UIAlertController+block.h"

@implementation AlertHelper

+ (void)showAlertViewForViewController:(UIViewController *)viewController
                                 title:(NSString *)title
                               message:(NSString *)message
                destructiveButtonTitle:(NSString *)destructiveTitle
                     cancelButtonTitle:(NSString *)cancelTitle
                     otherButtonTitles:(NSArray<NSString *> *)otherTitles
                   buttonTappedHandler:(AlertButtonTappedBlock)block {
    if ([UIDevice currentDevice].systemVersion.integerValue < 8) {
        [UIAlertView showWithTitle:title message:message cancelButtonTitle:cancelTitle otherButtonTitles:otherTitles buttonTappedHandler:block];
    } else {
        [UIAlertController showWithStyle:UIAlertControllerStyleAlert forViewController:viewController title:title message:message destructiveButtonTitle:destructiveTitle cancelButtonTitle:cancelTitle otherButtonTitles:otherTitles buttonTappedHandler:block];
    }
}

+ (void)showActionSheetForViewController:(UIViewController *)viewController
                                   title:(NSString *)title
                                 message:(NSString *)message
                  destructiveButtonTitle:(NSString *)destructiveTitle
                       cancelButtonTitle:(NSString *)cancelTitle
                       otherButtonTitles:(NSArray<NSString *> *)otherTitles
                     buttonTappedHandler:(AlertButtonTappedBlock)block {
    if ([UIDevice currentDevice].systemVersion.integerValue < 8) {
        [UIActionSheet showInView:viewController.view title:title destructiveTitle:destructiveTitle cancelButtonTitle:cancelTitle otherButtonTitles:otherTitles buttonTappedHandler:block];
    } else {
        [UIAlertController showWithStyle:UIAlertControllerStyleActionSheet forViewController:viewController title:title message:message destructiveButtonTitle:destructiveTitle cancelButtonTitle:cancelTitle otherButtonTitles:otherTitles buttonTappedHandler:block];
    }
    
}
@end
