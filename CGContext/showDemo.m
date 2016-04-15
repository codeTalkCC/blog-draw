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
    
    //宽度
    CGContextSetLineWidth(ctx, 20);
    
    //线的颜色
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    
    //填充的颜色
    CGContextSetFillColorWithColor(ctx, [UIColor purpleColor].CGColor);
    
    /**
     *  线段头尾部样式
     *  kCGLineCapButt:不绘制端点
     *  kCGLineCapRound:圆弧
     *  kCGLineCapSquare:直角
     */
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    /**
     *  拐点样式
     * kCGLineJoinMiter:直角
     * kCGLineJoinRound:圆弧
     * kCGLineJoinBevel:斜角
     */
    CGContextSetLineJoin(ctx, kCGLineJoinBevel);
    
    //直线
    [self lineDrawedWihtContex:ctx beginPoint:CGPointMake(8, 72) endPoint:CGPointMake(300, 72)];
    CGContextStrokePath(ctx);

    //矩形
    [self retWithContextRef:ctx];
    CGContextStrokePath(ctx);
    
    //圆弧
    [self curveDrawedWithContex:ctx];
    CGContextStrokePath(ctx);
    
    //圆
    [self circleWithContexRef:ctx];
    CGContextStrokePath(ctx);
    
    //画文字
    NSString *string = @"这是一个绘制图形的demo";
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:[UIColor blueColor] forKey:NSForegroundColorAttributeName];
    [dic setObject:[UIFont systemFontOfSize:22] forKey:NSFontAttributeName];
    [string drawInRect:CGRectMake(0, 400, 300, 30) withAttributes:dic];
    
    
   
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
    CGFloat radius = 66;
//    CGPoint bPoint = CGPointMake(center.x + radius, center.y);
//    CGContextMoveToPoint(ctx, bPoint.x, bPoint.y);
    CGContextAddArc(ctx, center.x, center.y, radius, 0, M_PI, 0);
}

/**
 *  画矩形
 *
 *  @param ctx ctx
 */
- (void)retWithContextRef:(CGContextRef )ctx{

    CGContextAddRect(ctx, CGRectMake(150, 150, 150, 150));
}


/**
 *  画圆
 *
 *  @param ctx ctx
 */
- (void)circleWithContexRef:(CGContextRef )ctx{
    
//    CGContextAddArc(ctx, 200, 200, 20, 0, 2*M_PI, 0);
    CGContextAddEllipseInRect(ctx, CGRectMake(200, 200, 100, 100));

//    CGContextClosePath(ctx);
}
@end
