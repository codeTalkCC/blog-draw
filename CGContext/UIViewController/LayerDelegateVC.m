//
//  LayerDelegateVC.m
//  CGContext
//
//  Created by Ben on 16/5/5.
//  Copyright © 2016年 Ben. All rights reserved.
//

#import "LayerDelegateVC.h"

@interface LayerDelegateVC ()

@property (strong ,nonatomic) CALayer *layer;
@end

@implementation LayerDelegateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"实现图层代理";
    
    //全局变量
//    _layer = [[CALayer alloc]init];
//    _layer.bounds = CGRectMake(100, 400, 180, 180);
//    _layer.position = CGPointMake(100, 400);
//    _layer.backgroundColor = [UIColor grayColor].CGColor;
//    [self.view.layer addSublayer:_layer];
//    _layer.delegate = self;
//    [_layer setNeedsDisplay];

    
    //局部变量
//    CALayer *layer = [[CALayer alloc]init];
//    layer.bounds = CGRectMake(100, 400, 180, 180);
//    layer.position = CGPointMake(100, 400);
//    layer.backgroundColor = [UIColor grayColor].CGColor;
//    layer.delegate = self;
//    [self.view.layer addSublayer:layer];
//    [layer setNeedsDisplay];
    
    //图像
    [self creatLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidDisappear:(BOOL)animated{

    [super viewDidDisappear:animated];
    [_layer removeFromSuperlayer];
    _layer = nil;
}


//- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
//    
//    NSLog(@"图层代理");
//     //如果你在这里用ctx绘图，其实这绘图就是图层代理(显示代理)
//    layer.position = CGPointMake(200, 200); //设置有效
//   
////    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
////    CGContextSetRGBStrokeColor(ctx, 135.0/255.0, 232.0/255.0, 84.0/255.0, 1);
////    //    CGContextFillRect(ctx, CGRectMake(0, 0, 100, 100));
////    //    CGContextFillEllipseInRect(ctx, CGRectMake(50, 50, 100, 100));
////    CGContextMoveToPoint(ctx, 94.5, 33.5 + 100);
////    //// Star Drawing
////    CGContextAddLineToPoint(ctx,104.02, 47.39 + 100);
////    CGContextAddLineToPoint(ctx,120.18, 52.16 + 100);
////    CGContextAddLineToPoint(ctx,109.91, 65.51 + 100);
////    CGContextAddLineToPoint(ctx,110.37, 82.34 + 100);
////    CGContextAddLineToPoint(ctx,94.5, 76.7 + 100);
////    CGContextAddLineToPoint(ctx,78.63, 82.34 + 100);
////    CGContextAddLineToPoint(ctx,79.09, 65.51 + 100);
////    CGContextAddLineToPoint(ctx,68.82, 52.16 + 100);
////    CGContextAddLineToPoint(ctx,84.98, 47.39 + 100);
////    CGContextClosePath(ctx);
////    CGContextFillPath(ctx);
////    
////    CGContextDrawPath(ctx, kCGPathFillStroke);
//    CGContextSaveGState(ctx);
//    CGContextSetLineWidth(ctx, 10);
//    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
//    CGContextMoveToPoint(ctx, 64, 64);
//    CGContextAddLineToPoint(ctx, 128, 128);
//    CGContextStrokePath(ctx);
//    CGContextRestoreGState(ctx);
//}

#pragma mark 图层代理绘图
- (void)creatLayer{
    
    //阴影图层
    CALayer *layerShadow = [[CALayer alloc]init];
    layerShadow.backgroundColor = [[UIColor blueColor]CGColor];
    layerShadow.bounds = CGRectMake(0, 0, 100, 100);
    layerShadow.position = self.view.center;
    layerShadow.cornerRadius = 100 / 2;
    layerShadow.shadowColor = [UIColor grayColor].CGColor;
    layerShadow.shadowOffset = CGSizeMake(10, 10);
    layerShadow.shadowOpacity = 0.8;
    [self.view.layer addSublayer:layerShadow];
    
    _layer = [[CALayer alloc]init];
    _layer.backgroundColor = [UIColor purpleColor].CGColor;
    _layer.bounds = CGRectMake(0, 0, 100, 100);
    _layer.position = self.view.center;
    _layer.cornerRadius = 100 / 2;
    _layer.masksToBounds = YES;
    
    
    //图形上下文形变，图片倒立问题
    //    layer.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
    [_layer setValue:@M_PI forKeyPath:@"transform.rotation.x"];
    //设置外边框
    _layer.borderColor = [UIColor greenColor].CGColor;
    _layer.borderWidth = 2;
    
    //a1设置代理
    _layer.delegate = self;
    [_layer setNeedsDisplay];
    
    //b1直接设置
    //    UIImage *image = [UIImage imageNamed:@"girl"];
    //    [layer setContents:(id)image.CGImage];
    
    [self.view.layer addSublayer:_layer];
}


- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    
    CGContextSaveGState(ctx);
    CGFloat width = layer.bounds.size.width;
    NSLog(@"图层代理");
    
    //    //图形上下文形变，图片倒立问题
    //    CGContextScaleCTM(ctx, 1, -1);
    //    CGContextTranslateCTM(ctx, 0, -width);
    
    UIImage *image = [UIImage imageNamed:@"girl"];
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, width), image.CGImage);
    

    
    CGContextRestoreGState(ctx);
}
@end
