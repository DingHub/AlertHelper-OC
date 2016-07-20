# AlertHelper-OC

Show an alertView or actionSheet with a call back block
If the system version < 8.0, we will use UIAlertView  or UIActionSheet, otherwise, UIAlertController.

useage
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
  
  We can also show an action sheet just almost like avove.
