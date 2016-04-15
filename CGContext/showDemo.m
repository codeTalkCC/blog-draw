//
//  showDemo.m
//  CGContext
//
//  Created by Ben on 16/4/14.
//  Copyright © 2016年 Ben. All rights reserved.
//

#import "showDemo.h"

@implementation showDemo

- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 2);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor purpleColor].CGColor);
    
    //直线
    [self lineDrawedWihtContex:ctx beginPoint:CGPointMake(8, 72) endPoint:CGPointMake(300, 72)];
    CGContextStrokePath(ctx);

    //矩形
    [self retWithContextRef:ctx];
    CGContextFillPath(ctx);
    
    //圆弧
    [self curveDrawedWithContex:ctx];
    CGContextStrokePath(ctx);
    //圆
    
    //画文字
    
   
}

/**
 *  画直线
 *
 *  @param contextRef 直线的载体-上下文
 */
- (void)lineDrawedWihtContex:(CGContextRef )contextRef beginPoint:(CGPoint )bPoint endPoint:(CGPoint )ePoint {
    
    CGContextMoveToPoint(contextRef, bPoint.x,bPoint.y);
    CGContextAddLineToPoint(contextRef, ePoint.x , ePoint.y);
}

/**
 *  画圆弧
 *
 *  @param ctx ctx
 */
- (void)curveDrawedWithContex:(CGContextRef )ctx{
    
    CGPoint center = CGPointMake(100, 100);
    CGFloat radius = 15;
//    CGPoint bPoint = CGPointMake(center.x + radius, center.y);
//    CGContextMoveToPoint(ctx, bPoint.x, bPoint.y);
    CGContextAddArc(ctx, center.x, center.y, radius, 0, M_PI, 0);
}


- (void)retWithContextRef:(CGContextRef )ctx{

    CGContextAddRect(ctx, CGRectMake(150, 150, 150, 150));
}


@end
