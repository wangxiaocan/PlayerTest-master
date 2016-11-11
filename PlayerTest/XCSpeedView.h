//
//  XCSpeedView.h
//  PlayerTest
//
//  Created by 王文科 on 2016/11/11.
//  Copyright © 2016年 wangwenke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCSpeedView : UIView

@property (nonatomic, assign) double totalTime;
@property (nonatomic, assign) double currentTime;
@property (nonatomic,   copy) NSString *totalTimeString;
@property (nonatomic,   copy) NSString *currentTimeString;

@property (nonatomic, assign) BOOL isFastForward;/**< default is YES */

@end
