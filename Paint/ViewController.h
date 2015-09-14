//
//  ViewController.h
//  Paint
//
//  Created by tarena on 15-7-6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PaintLineView;
@class FreeLineView;

@interface ViewController : UIViewController{
    IBOutlet UISegmentedControl *segmentedControl;
    IBOutlet FreeLineView *freeLineView;
    IBOutlet PaintLineView *paintLineView;
}
@property(strong,nonatomic) PaintLineView *paintLineView;
@property(strong,nonatomic) FreeLineView *freeLineView;
@property(nonatomic,retain) UISegmentedControl *segmentedControl;
-(IBAction)segmentChenged:(id)sender;
@end
