//
//  XCSpeedView.m
//  PlayerTest
//
//  Created by 王文科 on 2016/11/11.
//  Copyright © 2016年 wangwenke. All rights reserved.
//

#import "XCSpeedView.h"

#define XC_SPEED_WIDTH          140.0
#define XC_SPEED_HEIGHT         140.0
#define XC_SPEED_IMAGE_WIDTH    60.0
#define XC_SPEED_IMAGE_HEIGHT   ((102.0 / 163.0) * XC_SPEED_IMAGE_WIDTH)
#define XC_SPEED_DISTANCE       20.0
#define XC_LABEL_HEIGHT         20.0
@interface XCSpeedView()

@property (nonatomic, strong) UIImageView *speedImage;
@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation XCSpeedView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, XC_SPEED_WIDTH, XC_SPEED_HEIGHT)];
    if (self) {
        self.clipsToBounds = NO;
        self.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.7];
        self.layer.cornerRadius = 6.0;
        
        _currentTime = 0.f;
        _totalTime = 0.f;
        _currentTimeString = @"00:00:00";
        _totalTimeString = @"00:00:00";
        
        _isFastForward = YES;
        
        _speedImage = [[UIImageView alloc]init];
        _speedImage.image = [UIImage imageNamed:@"Icon_Video_Fast_Forward"];
        [self addSubview:_speedImage];
        
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:13.0];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        _timeLabel.textColor = [UIColor whiteColor];
        _timeLabel.text = [NSString stringWithFormat:@"%@/%@",_currentTimeString,_totalTimeString];
        [self addSubview:_timeLabel];
        _timeLabel.backgroundColor = [UIColor clearColor];
        

        _speedImage.frame = CGRectMake(XC_SPEED_WIDTH / 2.0 - XC_SPEED_IMAGE_WIDTH / 2.0, XC_SPEED_HEIGHT / 2.0 - (XC_SPEED_IMAGE_HEIGHT + XC_LABEL_HEIGHT + XC_SPEED_DISTANCE) / 2.0, XC_SPEED_IMAGE_WIDTH, XC_SPEED_IMAGE_HEIGHT);
        _timeLabel.frame = CGRectMake(0, _speedImage.frame.origin.x + _speedImage.bounds.size.height + XC_SPEED_DISTANCE, XC_SPEED_WIDTH, XC_LABEL_HEIGHT);
        
        
    }
    return self;
}


- (void)setBounds:(CGRect)bounds{
    [super setBounds:CGRectMake(bounds.origin.x, bounds.origin.y, XC_SPEED_WIDTH, XC_SPEED_HEIGHT)];
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:CGRectMake(frame.origin.x, frame.origin.y, XC_SPEED_WIDTH, XC_SPEED_HEIGHT)];
}


- (void)setIsFastForward:(BOOL)isFastForward{
    _isFastForward = isFastForward;
    _speedImage.image = _isFastForward?[UIImage imageNamed:@"Icon_Video_Fast_Forward"]:[UIImage imageNamed:@"Icon_Video_Rewind"];
}


- (void)setCurrentTime:(double)currentTime{
    if (isnan(currentTime)) {
        currentTime = 0.f;
    }
    _currentTime = currentTime;
    self.currentTimeString = [self convertTimeToString:currentTime];
}

- (void)setTotalTime:(double)totalTime{
    if (isnan(totalTime)) {
        totalTime = 0.f;
    }
    _totalTime = totalTime;
    self.totalTimeString = [self convertTimeToString:totalTime];
}

- (void)setCurrentTimeString:(NSString *)currentTimeString{
    if (currentTimeString) {
        _currentTimeString = currentTimeString;
        [self changeTimeLabelString];
    }
}

- (void)setTotalTimeString:(NSString *)totalTimeString{
    if (totalTimeString) {
        _totalTimeString = totalTimeString;
        [self changeTimeLabelString];
    }
}

- (NSString *)convertTimeToString:(double)second{
    NSInteger hourValue = (NSInteger)(second / 3600);
    NSInteger minuteValue = (NSInteger)((NSInteger)second % 3600 / 60);
    NSInteger secondValue = (NSInteger)((NSInteger)second % 3600 % 60);
    NSString *timeString = nil;
    if (hourValue >= 1) {
        timeString = [NSString stringWithFormat:@"%02ld:%02ld:%02ld",(long)hourValue,(long)minuteValue,(long)secondValue];
    } else {
        timeString = [NSString stringWithFormat:@"%02ld:%02ld",(long)minuteValue,(long)secondValue];
    }
    
    return timeString;
}

- (void)changeTimeLabelString{
    _timeLabel.text = [NSString stringWithFormat:@"%@/%@",_currentTimeString,_totalTimeString];
}


@end
