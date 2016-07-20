//
//  UIAlertView+block.m
//  iOSProjectFrame
//
//  Created by admin on 16/7/19.
//  Copyright © 2016年 Ding. All rights reserved.
//

#import "UIAlertView+block.h"
#import <objc/runtime.h>

static const void *kAlertButtonTappedHandlerKey = "kAlertButtonTappedHandlerKey";
@interface UIApplication (AlertView) <UIAlertViewDelegate>

@end

@implementation UIApplication (AlertView)
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.buttonTappedHandler) {
        alertView.buttonTappedHandler(buttonIndex);
    }
}
@end

@implementation UIAlertView (block)

- (AlertButtonTappedBlock)buttonTappedHandler {
    return objc_getAssociatedObject(self, kAlertButtonTappedHandlerKey);
}
- (void)setButtonTappedHandler:(AlertButtonTappedBlock)buttonTappedHandler {
    objc_setAssociatedObject(self, kAlertButtonTappedHandlerKey, buttonTappedHandler, OBJC_ASSOCIATION_COPY);
}

+ (void)showWithTitle:(NSString *)title
              message:(NSString *)message
    cancelButtonTitle:(NSString *)cancelTitle
    otherButtonTitles:(NSArray<NSString *> *)otherTitles
  buttonTappedHandler:(AlertButtonTappedBlock)block {
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:[UIApplication sharedApplication]
                                              cancelButtonTitle:cancelTitle
                                              otherButtonTitles:nil];
    alertView.buttonTappedHandler = block;
    for (NSString *title in otherTitles) {
        [alertView addButtonWithTitle:title];
    }
    [alertView show];
}

@end
