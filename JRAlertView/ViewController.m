//
//  ViewController.m
//  JRAlertView
//
//  Created by biyabi on 15/6/30.
//  Copyright © 2016年 caijunrong. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertView+JRBlockWork.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClick:(id)sender {
    
    [UIAlertView alertViewWithTitle:@"主题1"
                            message:@"消息主体1"
                  cancelButtonTitle:@"取消"
                  otherButtonTitles:[NSArray arrayWithObjects:@"第一个", @"第二个", nil]
                          onDismiss:^(NSInteger buttonIndex) {
                              
         NSLog(@"%ld,first", buttonIndex);
                              
     } onCancel:^(){
         
         NSLog(@"Cancelled,first");
         
     }];
    
}

- (IBAction)anotherBtnCLick:(id)sender {
    
    [UIAlertView alertViewWithTitle:@"主题2"
                            message:@"消息主体2"
                  cancelButtonTitle:@"取消"
                  otherButtonTitles:[NSArray arrayWithObjects:@"就一个", nil]
                          onDismiss:^(NSInteger buttonIndex) {
                              
                              NSLog(@"%ld,second", buttonIndex);
                              
                          } onCancel:^(){
                              
                              NSLog(@"Cancelled,second");
                              
                          }];
    
}
@end
