# AlertHelper-OC

A category of UIViewController to add handy methods to show alerts with button call back block.<br>
If the system version < 8.0, we will use UIAlertView or UIActionSheet, otherwise, UIAlertController.<br>

Impletion :<br>
Categories of UIAlertView, UIActionSheet and UIAlertController to add block use, and a category of UIViewController to show alert.<br>

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
  
