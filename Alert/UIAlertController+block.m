//
//  UIAlertController+block.m
//  iOSProjectFrame
//
//  Created by admin on 16/7/19.
//  Copyright © 2016年 Ding. All rights reserved.
//

#import "UIAlertController+block.h"
#import <objc/runtime.h>

static const void *kAlertControlButtonTappedHandlerKey = "kAlertControlButtonTappedHandlerKey";
@implementation UIAlertController (block)

- (AlertControlButtonTappedBlock)buttonTappedHandler {
    return objc_getAssociatedObject(self, kAlertControlButtonTappedHandlerKey);
}
- (void)setButtonTappedHandler:(AlertControlButtonTappedBlock)buttonTappedHandler {
    objc_setAssociatedObject(self, kAlertControlButtonTappedHandlerKey, buttonTappedHandler, OBJC_ASSOCIATION_COPY);
}

+ (void)showWithStyle:(UIAlertControllerStyle)style
    forViewController:(UIViewController *)viewController
                title:(NSString *)title
              message:(NSString *)message
destructiveButtonTitle:(NSString *)destructiveTitle
    cancelButtonTitle:(NSString *)cancelTitle
    otherButtonTitles:(NSArray<NSString *> *)otherTitles
  buttonTappedHandler:(AlertControlButtonTappedBlock)block {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    if (destructiveTitle) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:destructiveTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            block(0);
        }];
        [controller addAction:action];
    }
    if (cancelTitle) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            block(destructiveTitle ? 1 : 0);
        }];
        [controller addAction:action];
    }
    
    [otherTitles enumerateObjectsUsingBlock:^(NSString * title, NSUInteger i, BOOL * _Nonnull stop) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSInteger index = 0;
            if (cancelTitle == nil && destructiveTitle == nil) {
                index = i;
            } else if (cancelTitle && destructiveTitle){
                index = i + 2;
            } else {
                index = i + 1;
            }
            block(index);
        }];
        [controller addAction:action];
    }];
    [viewController presentViewController:controller animated:YES completion:nil];
}
@end
