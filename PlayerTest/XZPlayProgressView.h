//
//  XZPlayProgressView.h
//  PlayerTest
//
//  Created by wangwenke on 16/7/14.
//  Copyright © 2016年 wangwenke. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XCSlideView;

@interface XZPlayProgressView : UIView

@property (nonatomic, strong) UIButton       *playBtn;
@property (nonatomic, strong) UIButton       *fullBtn;
@property (nonatomic, strong) XCSlideView    *progressSlider;
@property (nonatomic, strong) UILabel        *currentTimeLabel;
@property (nonatomic, strong) UILabel        *totalDurationLabel;

@end
