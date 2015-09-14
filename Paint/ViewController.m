//
//  ViewController.m
//  Paint
//
//  Created by tarena on 15-7-6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "PaintLineView.h"
#import "FreeLineView.h"

#define Line 0
#define FreeLine 1

@implementation ViewController
@synthesize paintLineView;
@synthesize freeLineView;
@synthesize segmentedControl;

-(IBAction)segmentChenged:(id)sender{
    NSLog(@"segmentController was Chenged");
    UISegmentedControl *segment = sender;
    switch ([segment selectedSegmentIndex]) {
        case Line:
            freeLineView.hidden = TRUE;
            paintLineView.hidden = FALSE;
            break;
        case FreeLine:
            paintLineView.hidden = TRUE;
            freeLineView.hidden = FALSE;
            break;
        default:
            break;
    }
    NSLog(@"%ld",[segment selectedSegmentIndex]);
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    paintLineView.backgroundColor=[UIColor whiteColor];
    //freeLineView = [[FreeLineView alloc]init];
    freeLineView.backgroundColor=[UIColor whiteColor];
    if ([segmentedControl selectedSegmentIndex] == Line) {
        freeLineView.hidden = true;
        paintLineView.hidden= false;
    }
}


@end
