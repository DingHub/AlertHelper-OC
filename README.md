# AlertHelper-OC

Show an alert view or action sheet with a call back block.<br>
If the system version < 8.0, we will use UIAlertView  or UIActionSheet, otherwise, UIAlertController.

usage
---
```
#import "UIViewController+BlockAlert.h"
```
```
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
 ```
  
  We can also show an action sheet just almost like above.<br>
  <br>
  You can also find a Swift version [HERE.](https://github.com/DingHub/AlertHelper-Swift)
  
