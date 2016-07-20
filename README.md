# AlertHelper-OC

Show an alertView or actionSheet with a call back block.<br>
If the system version < 8.0, we will use UIAlertView  or UIActionSheet, otherwise, UIAlertController.

usage
---
```
#import "AlertHelper.h"
```
```
[AlertHelper showAlertViewForViewController:self
                                            title:@"Title"
                                          message:@"Message"
                           destructiveButtonTitle:@"destructive"
                                cancelButtonTitle:@"cancel"
                                otherButtonTitles:@[@"boy",@"girl"]
                              buttonTappedHandler:^(NSInteger buttonIndex) {
                                  NSLog(@"%zd", buttonIndex);
                              }];

  ```
  
  We can also show an action sheet just almost like above.<br>
  <br>
  You can also find a Swift version [HERE.](https://github.com/DingHub/AlertHelper-Swift)
  
