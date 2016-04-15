//
//  ViewController.m
//  CGContext
//
//  Created by Ben on 16/4/14.
//  Copyright © 2016年 Ben. All rights reserved.
//

#import "ViewController.h"
#import "showDemo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    showDemo *show = [[showDemo alloc]initWithFrame:self.view.frame];
    [self.view addSubview:show];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}





@end
