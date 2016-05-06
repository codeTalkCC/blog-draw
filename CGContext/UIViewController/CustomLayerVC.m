//
//  CustomLayerVC.m
//  CGContext
//
//  Created by Ben on 16/5/5.
//  Copyright © 2016年 Ben. All rights reserved.
//

#import "CustomLayerVC.h"
#import "pentavleView.h"
#import "pentacleLayer.h"
@interface CustomLayerVC ()

@end

@implementation CustomLayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    
    self.navigationItem.title = @"自定义CALayer";
    pentavleView *view=[[pentavleView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor=[UIColor grayColor];
    [self.view addSubview:view];
    
    
    //没有实现绘图，个人觉得是因为self.view此时已经创建好了，那么绘图已经不起作用了。上面的自定义视图为什么能起作用是因为自定义视图没创建好的时候就已经加了自定义图层，这个方法想要实现效果，只能实现图层代理
    pentacleLayer *layer = [[pentacleLayer alloc]init];
    layer.bounds = CGRectMake(100, 400, 180, 180);
    layer.position = CGPointMake(100, 400);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    [layer setNeedsDisplay];
    [self.view.layer addSublayer:layer];
    
   
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
