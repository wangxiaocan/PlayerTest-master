//
//  XZPlayProgressView.m
//  PlayerTest
//
//  Created by wangwenke on 16/7/14.
//  Copyright © 2016年 wangwenke. All rights reserved.
//

#import "XZPlayProgressView.h"
#import "XCSlideView.h"

@implementation XZPlayProgressView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self resetAllSubviews];
    }
    return self;
}


- (void)resetAllSubviews{
    for (UIView *subView in self.subviews) {
        [subView removeFromSuperview];
    }
    _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _playBtn.backgroundColor = [UIColor clearColor];
    [self addSubview:_playBtn];
    [_playBtn setImage:[UIImage imageNamed:@"icon_pause"] forState:UIControlStateNormal];
    
    _currentTimeLabel = [[UILabel alloc]init];
    _currentTimeLabel.backgroundColor = [UIColor clearColor];
    _currentTimeLabel.font = [UIFont systemFontOfSize:13.0];
    _currentTimeLabel.textAlignment = NSTextAlignmentRight;
    _currentTimeLabel.textColor = [UIColor whiteColor];
    [self addSubview:_currentTimeLabel];
    
    _progressSlider = [[XCSlideView alloc]init];
    _progressSlider.backgroundColor = [UIColor clearColor];
    _progressSlider.touchImage = [UIImage imageNamed:@"icon_progress"];
    [self addSubview:_progressSlider];
    
    _totalDurationLabel = [[UILabel alloc]init];
    _totalDurationLabel.backgroundColor = [UIColor clearColor];
    _totalDurationLabel.font = [UIFont systemFontOfSize:13.0];
    _totalDurationLabel.textAlignment = NSTextAlignmentLeft;
    _totalDurationLabel.textColor = [UIColor whiteColor];
    [self addSubview:_totalDurationLabel];
    
    _fullBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _fullBtn.backgroundColor = [UIColor clearColor];
    [_fullBtn setImage:[UIImage imageNamed:@"icon_full"] forState:UIControlStateNormal];
    [self addSubview:_fullBtn];
    
    
    [_playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(10.0);
        make.top.equalTo(self.mas_top).with.offset(10.0);
        make.bottom.equalTo(self.mas_bottom).with.offset(-10.0);
        make.width.equalTo(_playBtn.mas_height);
    }];
    
    [_currentTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.playBtn.mas_right);
        make.width.equalTo(_totalDurationLabel.mas_width);
    }];
    
    [_progressSlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(_currentTimeLabel.mas_right).with.offset(5.0);
        make.height.equalTo(self.mas_height).with.multipliedBy(0.5);
    }];
    
    [_totalDurationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.progressSlider.mas_right).with.offset(5.0);
    }];
    
    [_fullBtn setImageEdgeInsets:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)];
    [_fullBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(self.mas_right);
        make.width.equalTo(_fullBtn.mas_height);
        make.left.equalTo(_totalDurationLabel.mas_right).with.offset(5.0);
    }];
    

}

@end
