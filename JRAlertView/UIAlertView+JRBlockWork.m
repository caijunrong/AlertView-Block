//
//  UIAlertView+JRBlockWork.m
//  JRAlertView
//
//  Created by biyabi on 15/6/30.
//  Copyright © 2016年 caijunrong. All rights reserved.
//

#define CANCELSTRING @"确定"

#import "UIAlertView+JRBlockWork.h"
#import <objc/runtime.h>


static char DISMISS_IDENTIFER;
static char CANCEL_IDENTIFER;

@implementation UIAlertView (JRBlockWork)

@dynamic cancelBlock;
@dynamic dismissBlock;

- (void)setDismissBlock:(DismissBlock)dismissBlock{

    objc_setAssociatedObject(self, &DISMISS_IDENTIFER, dismissBlock,
                             OBJC_ASSOCIATION_COPY);
}

- (DismissBlock)dismissBlock{
    return objc_getAssociatedObject(self, &DISMISS_IDENTIFER);
}

- (void)setCancelBlock:(CancelBlock)cancelBlock
{
    objc_setAssociatedObject(self, &CANCEL_IDENTIFER, cancelBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CancelBlock)cancelBlock
{
    return objc_getAssociatedObject(self, &CANCEL_IDENTIFER);
}

+ (UIAlertView*) alertViewWithTitle:(NSString*) title
                            message:(NSString*) message
                  cancelButtonTitle:(NSString*) cancelButtonTitle
                  otherButtonTitles:(NSArray*) otherButtons
                          onDismiss:(DismissBlock) dismissed
                           onCancel:(CancelBlock) cancelled {
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title
                            message:message
                            delegate:[self class]
                            cancelButtonTitle:cancelButtonTitle
                            otherButtonTitles:nil];
    
    [alert setDismissBlock:dismissed];
    [alert setCancelBlock:cancelled];
    
    for (NSString *buttonTitle in otherButtons) {
        [alert addButtonWithTitle:buttonTitle];
    }
    
    [alert show];
    
    return alert;
}

+ (UIAlertView*) alertViewWithTitle:(NSString*) title
                            message:(NSString*) message {
    
    return [UIAlertView alertViewWithTitle:title
                                   message:message
                         cancelButtonTitle:CANCELSTRING];
}

+ (UIAlertView*) alertViewWithTitle:(NSString*) title
                            message:(NSString*) message
                  cancelButtonTitle:(NSString*) cancelButtonTitle {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:cancelButtonTitle
                                          otherButtonTitles: nil];
    [alert show];
    return alert;
}

+ (void)alertView:(UIAlertView*) alertView didDismissWithButtonIndex:(NSInteger) buttonIndex {
    
    if(buttonIndex == [alertView cancelButtonIndex])
    {
        if (alertView.cancelBlock) {
            alertView.cancelBlock();
        }
    }
    else
    {
        if (alertView.dismissBlock) {
            alertView.dismissBlock(buttonIndex - 1); // cancel button is button 0
        }
    }
}

@end
