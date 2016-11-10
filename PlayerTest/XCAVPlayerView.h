//
//  XCAVPlayerView.h
//  PlayerTest
//
//  Created by wangwenke on 16/7/13.
//  Copyright © 2016年 wangwenke. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,XCAVPlayerStatues){
    XCPlayerStatusReadyToPlay,
    XCPlayerStatusFailed,
    XCPlayerStatusUnknown,
    XCPlayerStatusPlayEnd,
};

typedef NS_ENUM(NSInteger,TouchesState){
    XCTouchesStateVolume,
    XCTouchesStateSpeed,
    XCTouchesStateBrightness,
    XCTouchesStateUnKnow,
};

@class XCAVPlayerView;

@protocol XCAVPlayerDelegate <NSObject>

/** 播放器状态改变 */
- (void)xcAVPlayerView:(XCAVPlayerView *)playerView reloadStatuesChanged:(XCAVPlayerStatues)xcPlayerStatues;

/** 播放时间进度改变 */
- (void)xcAVPlayerView:(XCAVPlayerView *)playerView currentPlayTimeChanged:(Float64)currentPlayTime;

@end


/** 播放器视图请添加到一个 view 上，不要直接添加在 self.view 上 */
@interface XCAVPlayerView : UIView

@property (nonatomic,   copy) NSString *videoTitle;/**< 视频标题 */
@property (nonatomic, strong) NSURL *playerUrl;/**< 播放链接 */


@property (nonatomic, assign) id<XCAVPlayerDelegate> delegate;
@property (nonatomic, assign) Float64 currentPlayTime;/**< current play time */
@property (nonatomic, assign) Float64 totalDuration;/**< video duration */
@property (nonatomic, assign) Float64 timeInterval;/**< available Duration (cached) */

@property (nonatomic, assign) BOOL    isShowTopTitleProgressView;/**< default is YES */
@property (nonatomic, assign) BOOL    isShowBottomProgressView;/**< default is YES */
@property (nonatomic, assign) BOOL    isShowResumViewAtPlayEnd;/**< default is YES */

@property (nonatomic, assign, readonly) TouchesState touchesState;/**< 手势状态 */


+ (instancetype)shareManager;

+ (void)startPlayInSuperView:(UIView *)superView;

/** 播放状态 */
- (BOOL)isPlaying;

/** play */
- (void)play;

/** pause */
- (void)pause;

/** resume */
- (void)resume;

/** 拉动进度条 */
- (void)seekToTime:(CGFloat)seekTime;

/** 播放时间 00:00:00 */
- (NSString *)convertTimeToString:(CGFloat)second;

/** 重制播放器 */
- (void)resumAllPlayerValues;

@end
