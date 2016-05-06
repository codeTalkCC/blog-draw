//
//  pentavleView.m
//  CGContext
//
//  Created by Ben on 16/5/6.
//  Copyright © 2016年 Ben. All rights reserved.
//

#import "pentavleView.h"
#import "pentacleLayer.h"

@implementation pentavleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype)initWithFrame:(CGRect)frame{
    NSLog(@"initWithFrame:");
    if (self=[super initWithFrame:frame]) {
        pentacleLayer *layer=[[pentacleLayer alloc]init];
        layer.bounds=CGRectMake(0, 0, 185, 185);
        layer.position=CGPointMake(160,284);
        layer.backgroundColor=[UIColor colorWithRed:0 green:146/255.0 blue:1.0 alpha:1.0].CGColor;
//        layer.delegate = self;  //这方法千万不能用，layer的代理对象不能是添加它的视图，因为视图已经是隐式代理，再设置代理会引起奔溃
        //显示图层
        [layer setNeedsDisplay];
        
        [self.layer addSublayer:layer];
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
    NSLog(@"2-drawRect:%@",UIGraphicsGetCurrentContext());//得到的当前图形上下文正是drawLayer中传递的
    [super drawRect:rect];
    
}

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    NSLog(@"1-drawLayer:inContext:%@",ctx);
    [super drawLayer:layer inContext:ctx];
    
    //如果你在这里用ctx绘图，其实这绘图就是图层代理(隐式代理)
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetRGBStrokeColor(ctx, 135.0/255.0, 232.0/255.0, 84.0/255.0, 1);
    //    CGContextFillRect(ctx, CGRectMake(0, 0, 100, 100));
    //    CGContextFillEllipseInRect(ctx, CGRectMake(50, 50, 100, 100));
    CGContextMoveToPoint(ctx, 94.5, 33.5 + 100);
    
    //// Star Drawing
    CGContextAddLineToPoint(ctx,104.02, 47.39 + 100);
    CGContextAddLineToPoint(ctx,120.18, 52.16 + 100);
    CGContextAddLineToPoint(ctx,109.91, 65.51 + 100);
    CGContextAddLineToPoint(ctx,110.37, 82.34 + 100);
    CGContextAddLineToPoint(ctx,94.5, 76.7 + 100);
    CGContextAddLineToPoint(ctx,78.63, 82.34 + 100);
    CGContextAddLineToPoint(ctx,79.09, 65.51 + 100);
    CGContextAddLineToPoint(ctx,68.82, 52.16 + 100);
    CGContextAddLineToPoint(ctx,84.98, 47.39 + 100);
    CGContextClosePath(ctx);
    
    
    CGContextDrawPath(ctx, kCGPathFillStroke);
}

@end
