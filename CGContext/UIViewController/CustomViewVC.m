//
//  CustomViewVC.m
//  CGContext
//
//  Created by Ben on 16/5/5.
//  Copyright © 2016年 Ben. All rights reserved.
//

#import "CustomViewVC.h"
#import "showDemo.h"

@interface CustomViewVC ()

@end

@implementation CustomViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"自定义UIView";
    
    showDemo *show = [[showDemo alloc]initWithFrame:self.view.frame];
    [self.view addSubview:show];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
