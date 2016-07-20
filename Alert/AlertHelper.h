//
//  AlertHelper.h
//  iOSProjectFrame
//
//  Created by admin on 16/7/20.
//  Copyright © 2016年 Ding. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AlertButtonTappedBlock)(NSInteger buttonIndex);

@interface AlertHelper : NSObject

/**
 *  Show an alert view with a call back block in the center of viewcontroller's view
 *  If the system version < 8.0, we will use UIAlertView , otherwise, UIAlertController
 *
 *  @param viewController
 *  @param title
 *  @param message
 *  @param destructiveTitle -if the system version < 8.0, this parameter will lose effictiveness
 *  @param cancelTitle
 *  @param otherTitles      
 *  @param block            -The index of buttons will ordered like : destructive button -> cancel button -> other buttons
 */
+ (void)showAlertViewForViewController:(UIViewController *)viewController
                                 title:(NSString *)title
                               message:(NSString *)message
                destructiveButtonTitle:(NSString *)destructiveTitle
                     cancelButtonTitle:(NSString *)cancelTitle
                     otherButtonTitles:(NSArray<NSString *> *)otherTitles
                   buttonTappedHandler:(AlertButtonTappedBlock)block;

/**
 *  Show an action sheet with a call back block at the bottom of viewController's view
 *  If the system version < 8.0, we will use UIActionSheet , otherwise, UIAlertController
 *
 *  @param viewController
 *  @param title
 *  @param message          -if the system version < 8.0, this parameter will lose effictiveness
 *  @param destructiveTitle
 *  @param cancelTitle
 *  @param otherTitles
 *  @param block            -The index of buttons will ordered like : destructive button -> cancel button -> other buttons
 */
+ (void)showActionSheetForViewController:(UIViewController *)viewController
                                   title:(NSString *)title
                                 message:(NSString *)message
                  destructiveButtonTitle:(NSString *)destructiveTitle
                       cancelButtonTitle:(NSString *)cancelTitle
                       otherButtonTitles:(NSArray<NSString *> *)otherTitles
                     buttonTappedHandler:(AlertButtonTappedBlock)block;

@end
