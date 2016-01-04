//
//  HSHomeCircleChartView.m
//  HSOpenPlatform
//
//  Created by 孟希羲 on 16/1/4.
//  Copyright © 2016年 孟希羲. All rights reserved.
//

#import "HSHomeCircleChartView.h"

@implementation HSHomeCircleChartView

-(void)setupView{
    [super setupView];
    [self initCircleChatView];
}

-(void)initCircleChatView{
    _circleChart = [[PNCircleChart alloc] initWithFrame:CGRectMake(0,(self.height - 100)/2, self.frame.size.width, 100.0)
                                                      total:@100
                                                    current:@65
                                                  clockwise:YES];
    _circleChart.backgroundColor = [UIColor whiteColor];
    [_circleChart strokeChart];
    [self addSubview:_circleChart];
}

@end
