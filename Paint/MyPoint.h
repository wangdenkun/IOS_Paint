//
//  MyPoint.h
//  OcBase
//
//  Created by wdk on 15/7/10.
//  Copyright (c) 2015年 wdk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyPoint : NSObject{
    CGPoint point;
    //不一定用的到
    float pointSize;
    UIColor *color;
}
@property(nonatomic) CGPoint point;
@property(nonatomic) float pointSize;
@property(nonatomic) UIColor *color;
@end
