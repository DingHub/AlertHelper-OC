//
//  UIActionSheet+block.m
//  iOSProjectFrame
//
//  Created by admin on 16/7/19.
//  Copyright © 2016年 Ding. All rights reserved.
//

#import "UIActionSheet+block.h"
#import <objc/runtime.h>

static const void *kActionButtonTappedHandlerKey = "kActionButtonTappedHandlerKey";
@interface UIApplication (ActionSheet) <UIActionSheetDelegate>

@end

@implementation UIApplication (ActionSheet)

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (actionSheet.buttonTappedHandler) {
        actionSheet.buttonTappedHandler(buttonIndex);
    }
}

@end

@implementation UIActionSheet (block)
- (ActionSheetButtonTappedBlock)buttonTappedHandler {
    return objc_getAssociatedObject(self, kActionButtonTappedHandlerKey);
}
- (void)setButtonTappedHandler:(ActionSheetButtonTappedBlock)buttonTappedHandler {
    objc_setAssociatedObject(self, kActionButtonTappedHandlerKey, buttonTappedHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

+ (void)showInView:(UIView *)view
             title:(NSString *)title
  destructiveTitle:(NSString *)destructiveTitle
 cancelButtonTitle:(NSString *)cancelTitle
 otherButtonTitles:(NSArray<NSString *> *)otherTitles
buttonTappedHandler:(ActionSheetButtonTappedBlock)block {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:title
                                                            delegate:[UIApplication sharedApplication]
                                                   cancelButtonTitle:cancelTitle
                                              destructiveButtonTitle:destructiveTitle
                                                   otherButtonTitles:nil];
    actionSheet.buttonTappedHandler = block;
    for (NSString *title in otherTitles) {
        [actionSheet addButtonWithTitle:title];
    }
    [actionSheet showInView:view];
}

@end
