//
//  ViewController.m
//  CGContext
//
//  Created by Ben on 16/4/14.
//  Copyright © 2016年 Ben. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"绘制图形的3种方式";
    
    //设置返回键不显示内容
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    CGFloat width = [[UIScreen mainScreen]bounds].size.width;;
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(width / 2 - 100 / 2, 80, 100, 100)];
    imageView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:imageView];
    
    
    
//    //直接获取上下文绘图（是无效的）
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGContextMoveToPoint(ctx, 0, 64);
//    CGContextAddLineToPoint(ctx, 200, 200);
//    CGContextStrokePath(ctx);
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    imageView.image = image;    //image也无效 为nil
//    
//    //用UIBezierPath绘图 （也是无效的）
//    UIBezierPath *path = [[UIBezierPath alloc]init];
//    [path moveToPoint:CGPointMake(0, 0)];
//    [path addLineToPoint:CGPointMake(100, 100)];
//    [path stroke];
    
    //创建图形上下文绘制 (获取图片显示)
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(200, 200), NO, 0);
    CGContextRef ctxI = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctxI, CGRectMake(0, 0, 200, 200));
    CGContextSetFillColorWithColor(ctxI, [UIColor blueColor].CGColor);
    CGContextFillPath(ctxI);
    UIImage *im = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    imageView.image = im;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

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
    
    CALayer *layer = [[CALayer alloc]init];
    layer.backgroundColor = [UIColor purpleColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = self.view.center;
    layer.cornerRadius = 100 / 2;
    layer.masksToBounds = YES;
    
    
    //图形上下文形变，图片倒立问题
//    layer.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
     [layer setValue:@M_PI forKeyPath:@"transform.rotation.x"];
    //设置外边框
    layer.borderColor = [UIColor greenColor].CGColor;
    layer.borderWidth = 2;
    
    //a1设置代理
    layer.delegate = self;
    [layer setNeedsDisplay];
    
    //b1直接设置
//    UIImage *image = [UIImage imageNamed:@"girl"];
//    [layer setContents:(id)image.CGImage];
   
    [self.view.layer addSublayer:layer];
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
    
    NSString *string = @"2这是一个绘制图形的demo2";
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:[UIColor blueColor] forKey:NSForegroundColorAttributeName];
    [dic setObject:[UIFont systemFontOfSize:22] forKey:NSFontAttributeName];
    [string drawInRect:CGRectMake(0, 0, 300, 30) withAttributes:dic];
    
    CGContextRestoreGState(ctx);
}



@end
