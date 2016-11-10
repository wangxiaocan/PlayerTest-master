//
//  XCSlideView.h
//  XCSlideView
//
//  Created by 王文科 on 2016/11/10.
//  Copyright © 2016年 xiaocan. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 自定义UISlider-用作播放器进度条 */
@interface XCSlideView : UIControl

@property (nonatomic, strong) UIColor *minimumTrackColor;/**< 播放进度条颜色 */
@property (nonatomic, strong) UIColor *maximumTrackColor;/**< 进度条底色 */
@property (nonatomic, strong) UIColor *cachesColor;/**< 缓存进度条颜色 */
@property (nonatomic, strong) UIImage *touchImage;

@property (nonatomic, assign) double  currentProgress;/**< default 0.f */
@property (nonatomic, assign) double  maxValue;/**< default 1.0f */
@property (nonatomic, assign) double  cachesValue;/**< default 0.f */
@property (nonatomic, assign) double  minValue;
@property (nonatomic, assign) CGFloat trackViewHeight;/**< default 3.0f */
@property (nonatomic, assign) CGSize  touchesSize;

- (void)resume;

@end
