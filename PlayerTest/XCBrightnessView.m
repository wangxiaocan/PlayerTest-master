//
//  XCBrightnessView.m
//  PlayerTest
//
//  Created by 王文科 on 2016/11/11.
//  Copyright © 2016年 wangwenke. All rights reserved.
//

#import "XCBrightnessView.h"

#define XC_BRIGHT_WIDTH         140.0
#define XC_BRIGHT_HEIGHT        140.0
#define XC_BRIGHT_IMAGE_WIDTH   60.0
#define XC_PROGRESS_HEIGHT      2.0
#define XC_DISTANCE             20.0

@interface XCBrightnessView();

@property (nonatomic, strong) UIProgressView *brightnessProgress;

@end

@implementation XCBrightnessView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, XC_BRIGHT_WIDTH, XC_BRIGHT_HEIGHT)];
    if (self) {
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.7];
        self.layer.cornerRadius = 6.0;
        
        UIImageView *brightnessImage = [[UIImageView alloc]init];
        brightnessImage.image = [UIImage imageNamed:@"Icon_Brightness_Image"];
        [self addSubview:brightnessImage];
        
        _brightnessProgress = [[UIProgressView alloc]init];
        [self addSubview:_brightnessProgress];
        
        brightnessImage.frame = CGRectMake(XC_BRIGHT_WIDTH / 2.0 - XC_BRIGHT_IMAGE_WIDTH / 2.0, XC_BRIGHT_HEIGHT / 2.0 - (XC_BRIGHT_IMAGE_WIDTH + XC_PROGRESS_HEIGHT + XC_DISTANCE) / 2.0, XC_BRIGHT_IMAGE_WIDTH, XC_BRIGHT_IMAGE_WIDTH);
        _brightnessProgress.frame = CGRectMake(10.0, brightnessImage.frame.origin.y + brightnessImage.bounds.size.height + XC_DISTANCE, XC_BRIGHT_WIDTH - 20.0, XC_PROGRESS_HEIGHT);
        
    }
    return self;
}

- (void)setBounds:(CGRect)bounds{
    [super setBounds:CGRectMake(bounds.origin.x, bounds.origin.y, XC_BRIGHT_WIDTH, XC_BRIGHT_HEIGHT)];
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:CGRectMake(frame.origin.x, frame.origin.y, XC_BRIGHT_WIDTH, XC_BRIGHT_HEIGHT)];
}

-(void)setBrightnessValue:(CGFloat)brightnessValue{
    _brightnessValue = brightnessValue;
    _brightnessProgress.progress = _brightnessValue;
}


@end
