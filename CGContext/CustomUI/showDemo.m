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
        self.frame = frame;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //宽度
    CGContextSetLineWidth(ctx, 2);
    
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
    
    //计算高度
    CGFloat y = 0;
    CGFloat devideHeight = [[UIScreen mainScreen]bounds].size.height / 5;
    CGFloat y1 = 16;
    CGFloat y2 = y1 + devideHeight;
    CGFloat y3 = y1 + devideHeight * 2;
    CGFloat y4 = y1 + devideHeight * 3;
    CGFloat y5 = y1 + devideHeight * 4;
    CGFloat fx = 8;         //字开始的x
    CGFloat cx = fx + 40;    //绘图开始的x
    
    //设置字体 - 同时也会让画笔的颜色改变
    NSMutableDictionary *fontDic = [[NSMutableDictionary alloc]init];
    [fontDic setObject:[UIFont systemFontOfSize:14] forKey:NSFontAttributeName];
    [fontDic setObject:[UIColor blueColor] forKey:NSForegroundColorAttributeName];
    //左右居中
    NSMutableParagraphStyle *ps = [[NSMutableParagraphStyle alloc]init];
    [ps setAlignment:NSTextAlignmentNatural];
    [fontDic setObject:ps forKey:NSParagraphStyleAttributeName];
   
    
    //直线
    //上下居中的点
    y = y1 + devideHeight / 2;
    NSString *string = @"直线";
    [string drawAtPoint:CGPointMake(fx, y - 8) withAttributes:fontDic];
//    [string drawInRect:CGRectMake(fx, y1, 60, devideHeight) withAttributes:fontDic];
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextMoveToPoint(ctx, cx, y);
    CGContextAddLineToPoint(ctx, 300, y);
    CGContextStrokePath(ctx);
    
    //曲线
    y = y2 + devideHeight / 2;
    string = @"曲线";
    [string drawAtPoint:CGPointMake(fx, y - 8) withAttributes:fontDic];
//    CGContextMoveToPoint(ctx, cx, y);
    CGContextAddArc(ctx, cx + devideHeight / 2, y, devideHeight / 2, 0, M_PI / 2, 1);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokePath(ctx);
    
    //圆
    y = y3 + devideHeight / 2;
    string = @"圆";
    [string drawAtPoint:CGPointMake(fx, y - 8) withAttributes:fontDic];
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextAddEllipseInRect(ctx, CGRectMake(cx + 100, y3, devideHeight, devideHeight));
    CGContextStrokePath(ctx);
    
    //矩形
    y = y4 + devideHeight / 2;
    string = @"矩形";
    [string drawAtPoint:CGPointMake(fx, y - 8) withAttributes:fontDic];
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextAddRect(ctx, CGRectMake(cx + 36, y4, devideHeight, devideHeight));
    CGContextStrokePath(ctx);
    
    //也可使用UIBezierPath
    y = y5 + devideHeight / 2;
    string = @"UIBezierPath绘图";
    [string drawAtPoint:CGPointMake(fx, y - 8) withAttributes:fontDic];
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path addArcWithCenter:CGPointMake(370 / 2, y) radius:devideHeight /4 startAngle:0 endAngle:2*M_PI clockwise:YES];
//    [path stroke];
    [path fill];
}
@end
