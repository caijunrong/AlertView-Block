//
//  UIAlertView+JRBlockWork.h
//  JRAlertView
//
//  Created by biyabi on 15/6/30.
//  Copyright © 2016年 caijunrong. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JRBaseBlockWork.h"

@interface UIAlertView (JRBlockWork)<UIAlertViewDelegate>

/*
*   完整调用
*/
+ (UIAlertView*) alertViewWithTitle:(NSString*) title
                            message:(NSString*) message
                  cancelButtonTitle:(NSString*) cancelButtonTitle
                  otherButtonTitles:(NSArray*) otherButtons
                          onDismiss:(DismissBlock) dismissed
                           onCancel:(CancelBlock) cancelled;

/*
 *   自带确定按钮
 */
+ (UIAlertView*) alertViewWithTitle:(NSString*) title
                            message:(NSString*) message;

/*
 *   自定义cancel显示的字
 */
+ (UIAlertView*) alertViewWithTitle:(NSString*) title
                            message:(NSString*) message
                  cancelButtonTitle:(NSString*) cancelButtonTitle;

@property (nonatomic, copy) DismissBlock dismissBlock;

@property (nonatomic, copy) CancelBlock cancelBlock;

@end
