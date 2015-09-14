//
//  PaintMapView.m
//  Paint
//
//  Created by tarena on 15-7-6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//
//  说明：
//      此类主要是画线 可通过两种方式画：在TextFeild里输入点然后点确定(控制器的drawButtonPressed ) 或者 在屏幕上点击一下(此类           touchesEnded)
//  bug:
//      将点击屏幕得到的点放到TextFeild内画线 线并没有画出来(或者先点击画线 再输入点画线) 说明在模拟器内通过点击得到的位置不是真实的位置
//  debug:
//      经周大神的一番调试 可以正常工作了 但使用setNeedsDisplayInRect方法会覆盖原图 还是不理想(但上一版本不会覆盖 好忧伤 看swift去+_+)
//  debug2:
//      经过一番怒查API 以及在网易公开课上学习 终于可以完整实现了 但还是不太好 重复画点差强人意 特别是路径很长的时候 还得再优化
//      总结的经验：还是那句编程世界里的老话：不要重复造轮子！！！多看API 多看模板 复用框架内的方法

#import "PaintLineView.h"
#import "MyPoint.h"

@class MyPoint;

#define accurate 1.0f
@interface PaintLineView()
@property (nonatomic) CGContextRef context;
@property(nonatomic) CGPoint point;
@property(nonatomic) CGPoint oldPoint;
@property(nonatomic) NSMutableArray *points;
@end

@implementation PaintLineView

-(CGPoint)oldPoint{
//    if (_oldPoint.x == ) {
//        _oldPoint=self.point;
//    }
    return _oldPoint;

}
#pragma mark -
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    //获取点击的位置
    UITouch *touch = [touches anyObject];
    //在父View中的位置
    CGPoint theTouchPoint = [touch locationInView:self.superview];
    //在整个window中的位置
    //CGPoint theTouchPoint = [touch locationInView:nil];
    NSLog(@"touchesEnded Get:  X:%f    Y:%f",theTouchPoint.x,theTouchPoint.y);
    //整合成CGRect 通知重绘
    CGPoint point = CGPointMake(theTouchPoint.x, theTouchPoint.y);
    [self myDraw:point];
}

-(void)myDraw:(CGPoint)point{
    //保存绘图点
    if (_points == nil) {
        _points = [[NSMutableArray alloc] init];
    }
    MyPoint *p = [[MyPoint alloc] init];
    p.point = point;
    [_points addObject:p];
    self.point=point;
    [self setNeedsDisplay];
    
}
-(void)drawRect:(CGRect)rect{
    NSLog(@"DrawRect Start");
    self.context = UIGraphicsGetCurrentContext();

    UIBezierPath *path = [[UIBezierPath alloc] init];
    CGPoint startPoint = [[_points objectAtIndexedSubscript:0] point];
    [path moveToPoint: startPoint];
    for (int x=0; x<_points.count; x++) {
        
        CGPoint p = CGPointMake(0.0f, 0.0f);
        p = [[_points objectAtIndexedSubscript:x] point];
        [path addLineToPoint:p];
        NSLog(@"Draw a new line,new point is %f %f",p.x,p.y);
    }
    [path stroke];
    
    self.oldPoint=self.point;
    NSLog(@"DrawRect end\n");
    NSLog(@"\n");
}
@end

