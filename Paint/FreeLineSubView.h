//
//  FreeLineSubView.h
//  Paint
//
//  Created by wdk on 15/7/11.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FreeLineSubView : UIView{
    IBOutlet UISlider *lineWith;
    IBOutlet UITextField *rValue;
    IBOutlet UITextField *gValue;
    IBOutlet UITextField *bValue;
}
@property UISlider *lineWith;
@property UITextField *rValue;
@property UITextField *gValue;
@property UITextField *bValue;
@end
