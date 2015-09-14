//
//  FreeLineView.m
//  Paint
//
//  Created by wdk on 15/7/11.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "FreeLineView.h"
#import "FreeLineSubView.h"
#import "MyPoint.h"

#define ColorR 0
#define ColorG 1
#define ColorB 2

@implementation FreeLineView
@synthesize line;
@synthesize allLines;
@synthesize lineWith;
@synthesize R;
@synthesize G;
@synthesize B;
@synthesize subView;
@synthesize isNeedToCreat;


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    isNeedToCreat = true;
    if ([allLines count] == 0) {
        allLines = [[NSMutableArray alloc] init];
    }
    line = [[NSMutableArray alloc] init];
    [allLines addObject:line];
//    if([allLines count] == 0){
//        allLines = [[NSMutableArray alloc] init];
//    }
    if(lineWith == 0){
        lineWith = 1;
    }
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    //allPoints:所有点
    //partOfPoints:一段点
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.superview];
    //一个单位点
    MyPoint *p = [[MyPoint alloc] init];
    
    p.point = point;
    p.pointSize = lineWith;
    //p.pointSize = touch.majorRadius/5;
    p.color = [[UIColor alloc] initWithRed:self.R green:self.G blue:self.B alpha:1.0];
    
    //当前没线 则初始化一条线
//    if(isNeedToCreat){
//        //line = [[NSMutableArray alloc] init];
//        [allLines addObject:line];
//        isNeedToCreat = false;
//    }else{
//        [line addObject:p];
//    }
    [line addObject:p];
    NSLog(@"FreeLineView get point: %f %f!!!!!!!!",point.x,point.y);
    [self setNeedsDisplay];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    //isNeedToCreat = false;
}

-(IBAction)editEnd:(id)sender{
    [sender resignFirstResponder];
}
-(IBAction)lineWithValueChanged:(id)sender{
    UISlider *slider = sender;
    self.lineWith = slider.value;
    NSLog(@"line with is changed,new with is %f\n",slider.value);
}
-(IBAction)colorChenged:(id)sender{
    UITextField *colorText = sender;
    switch ([colorText tag]) {
        case ColorR:
            self.R = [[colorText text] floatValue];
            break;
        case ColorG:
            self.G = [[colorText text] floatValue];
            break;
        case ColorB:
            self.B = [[colorText text] floatValue];
            break;
        default:
            break;
    }
}

-(void)drawRect:(CGRect)rect{
    NSLog(@"Draw allLines have %lu Lines",(unsigned long)[self.allLines count]);

    for (int j=0; j<allLines.count; j++) {
        
        NSMutableArray *theline = [allLines objectAtIndexedSubscript:j];
        UIBezierPath *path = [[UIBezierPath alloc] init];
        
        for (int i=0; i<[theline count]; i++) {
            MyPoint *theDrawPoint = [theline objectAtIndexedSubscript:i];
            [path setLineWidth:theDrawPoint.pointSize];
            [[theDrawPoint color] set];
            
            if (i==0) {
                [path moveToPoint:[[theline objectAtIndexedSubscript:0] point]];
            }else{
                [path addLineToPoint:theDrawPoint.point];
                NSLog(@"Line size is %f",theDrawPoint.pointSize);
            }
            NSLog(@"FreeLineView draw point: %f %f",theDrawPoint.point.x,theDrawPoint.point.y);
            NSLog(@"\n");
            [path stroke];
        }
    }
}
//快速链接的View无法调用构造函数？？
//-(id)init{
//    if (self = [super init]) {
//        points = [[NSMutableArray alloc] init];
//        NSLog(@"FreeLineView Init====");
//    }
//    return self;
//}
@end
