//
//  FreeLineView.h
//  Paint
//
//  Created by wdk on 15/7/11.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FreeLineSubView;

@interface FreeLineView : UIView{
    float lineWith;
    float R;
    float G;
    float B;
    NSMutableArray *line;
    NSMutableArray *allLines;
    IBOutlet FreeLineSubView *subView;
    bool isNeedToCreat;
}
@property NSMutableArray *line;
@property NSMutableArray *allLines;
@property float lineWith;
@property float R;
@property float G;
@property float B;
@property FreeLineSubView *subView;
@property bool isNeedToCreat;
-(IBAction)lineWithValueChanged:(id)sender;
-(IBAction)colorChenged:(id)sender;
-(IBAction)editEnd:(id)sender;
//-(id)init;
@end
