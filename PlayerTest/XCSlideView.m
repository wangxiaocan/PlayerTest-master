//
//  XCSlideView.m
//  XCSlideView
//
//  Created by 王文科 on 2016/11/10.
//  Copyright © 2016年 xiaocan. All rights reserved.
//

#import "XCSlideView.h"

@interface XCSlideView()

@property (nonatomic, strong) UIView      *maxMumTrackView;
@property (nonatomic, strong) UIView      *cachesView;
@property (nonatomic, strong) UIView      *miniMumTrackView;
@property (nonatomic, strong) UIImageView *touchesImageView;

@property (nonatomic, assign) BOOL        isCanTouchMove;

@end



@implementation XCSlideView

- (instancetype)init{
    self = [super init];
    if (self) {
        _maxValue        = 1.0f;
        _cachesValue     = 0.f;
        _currentProgress = 0.f;
        _trackViewHeight = 2.0f;
        _isCanTouchMove  = NO;
        _touchesSize     = CGSizeMake(16.0, 16.0);
        _maximumTrackColor = [UIColor grayColor];
        _cachesColor       = [UIColor lightGrayColor];
        _minimumTrackColor = [UIColor blueColor];
        _maxMumTrackView = [[UIView alloc]init];
        _touchImage = [UIImage imageNamed:@"touchesImage"];
        _maxMumTrackView.backgroundColor = _maximumTrackColor;
        _maxMumTrackView.clipsToBounds = YES;
        _maxMumTrackView.layer.cornerRadius = _trackViewHeight / 2.0;
        [self addSubview:_maxMumTrackView];
        
        _cachesView = [[UIView alloc]init];
        _cachesView.backgroundColor = _cachesColor;
        [_maxMumTrackView addSubview:_cachesView];
        
        _miniMumTrackView = [[UIView alloc]init];
        _miniMumTrackView.backgroundColor = _minimumTrackColor;
        [_maxMumTrackView addSubview:_miniMumTrackView];
        
        _touchesImageView = [[UIImageView alloc]init];
        _touchesImageView.contentMode = UIViewContentModeScaleAspectFit;
        _touchesImageView.image = _touchImage;
        [self addSubview:_touchesImageView];
        
        [self refreshAllViewFrames];
    }
    return self;
}

- (void)refreshAllViewFrames{
    _maxMumTrackView.frame = CGRectMake(_touchesSize.width / 2.0, self.bounds.size.height / 2.0 - _trackViewHeight, self.bounds.size.width - _touchesSize.width, _trackViewHeight);
    _cachesView.frame = CGRectMake(0, 0, (_cachesValue / _maxValue) * _maxMumTrackView.bounds.size.width, _maxMumTrackView.bounds.size.height);
    _miniMumTrackView.frame = CGRectMake(0, 0, (_currentProgress / _maxValue) * _maxMumTrackView.bounds.size.width, _maxMumTrackView.bounds.size.height);
    _touchesImageView.bounds = CGRectMake(0, 0, _touchesSize.width, _touchesSize.height);
    _touchesImageView.center = CGPointMake(_maxMumTrackView.frame.origin.x + _miniMumTrackView.bounds.size.width, _maxMumTrackView.center.y);
}

- (void)setCurrentProgress:(double)currentProgress{
    if (currentProgress < 0 || isnan(currentProgress)) {
        currentProgress = 0.f;
    }
    if (currentProgress > _maxValue) {
        currentProgress = _maxValue;
    }
    _currentProgress = currentProgress;
    [self refreshAllViewFrames];
}

- (void)setCachesValue:(double)cachesValue{
    if (cachesValue < 0 || isnan(cachesValue)) {
        cachesValue = 0.f;
    }
    if (cachesValue > _maxValue) {
        cachesValue = _maxValue;
    }
    _cachesValue = cachesValue;
    [self refreshAllViewFrames];
}

- (void)setMaxValue:(double)maxValue{
    if (maxValue < 0 || isnan(maxValue)) {
        maxValue = 1.f;
    }
    _maxValue = maxValue;
    [self refreshAllViewFrames];
}

- (void)setTouchesSize:(CGSize)touchesSize{
    if (touchesSize.width ==0 || touchesSize.height == 0) {
        touchesSize = CGSizeMake(12.0, 12.0);
    }
    [self refreshAllViewFrames];
}

- (void)setTrackViewHeight:(CGFloat)trackViewHeight{
    if (trackViewHeight == 0 || isnan(trackViewHeight)) {
        trackViewHeight = 2.0;
    }
    _trackViewHeight = trackViewHeight;
    _maxMumTrackView.layer.cornerRadius = _trackViewHeight / 2.0;
    [self refreshAllViewFrames];
}

- (void)setMaximumTrackColor:(UIColor *)maximumTrackColor{
    if (maximumTrackColor) {
        _maximumTrackColor = maximumTrackColor;
        _maxMumTrackView.backgroundColor = _maximumTrackColor;
    }
}

- (void)setCachesColor:(UIColor *)cachesColor{
    if (cachesColor) {
        _cachesColor = cachesColor;
        _cachesView.backgroundColor = _cachesColor;
    }
}

- (void)setMinimumTrackColor:(UIColor *)minimumTrackColor{
    if (minimumTrackColor) {
        _minimumTrackColor = minimumTrackColor;
        _miniMumTrackView.backgroundColor = _minimumTrackColor;
    }
}

- (void)setTouchImage:(UIImage *)touchImage{
    if (touchImage) {
        _touchImage = touchImage;
        _touchesImageView.image = _touchImage;
    }
}


//function
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    CGRect  touchImageFrame = _touchesImageView.frame;
    touchImageFrame = CGRectMake(touchImageFrame.origin.x - 5.0, touchImageFrame.origin.y - 5.0, touchImageFrame.size.width + 10.0, touchImageFrame.size.height + 10.0);
    if (CGRectContainsPoint(touchImageFrame, touchPoint)) {
        _isCanTouchMove = YES;
        [self sendActionsForControlEvents:UIControlEventTouchDown];
    }

}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (_isCanTouchMove) {
        UITouch *touch = [touches anyObject];
        CGPoint touchPoint = [touch locationInView:self];
        self.currentProgress = ((touchPoint.x - self.touchesSize.width / 2.0) / _maxMumTrackView.bounds.size.width) * _maxValue;
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (_isCanTouchMove) {
        _isCanTouchMove = NO;
        [self sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (_isCanTouchMove) {
        _isCanTouchMove = NO;
        [self sendActionsForControlEvents:UIControlEventTouchCancel];
    }
}

- (void)resume{
    _maxValue        = 1.0f;
    _cachesValue     = 0.f;
    _currentProgress = 0.f;
    _trackViewHeight = 2.0f;
    _isCanTouchMove  = NO;
    [self refreshAllViewFrames];
}

-(void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    if (controlEvents == UIControlEventTouchDown || controlEvents == UIControlEventValueChanged || controlEvents == UIControlEventTouchUpInside || controlEvents == UIControlEventTouchCancel) {
       [super addTarget:target action:action forControlEvents:controlEvents];
    }
}

@end
