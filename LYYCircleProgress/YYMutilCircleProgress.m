//
//  YYMutilCircleProgress.m
//  LYYCircleProgress
//
//  Created by Xiaoyue on 16/6/15.
//  Copyright © 2016年 李运洋. All rights reserved.
//

#import "YYMutilCircleProgress.h"

@interface YYMutilCircleProgress ()

/** 最外面的圆*/
@property (nonatomic, strong) CAShapeLayer *shaperLayer1;
/** 中间的圆*/
@property (nonatomic, strong) CAShapeLayer *shaperLayer2;
/** 最里面的圆*/
@property (nonatomic, strong) CAShapeLayer *shaperLayer3;
/** 线宽*/
@property (nonatomic, assign) CGFloat lineWidth;
/** 默认的颜色*/
@property (nonatomic, strong) NSArray *colors;
/** 存储进度条的容器*/
@property (nonatomic, strong) NSMutableArray *progresses;
/** 存储背景进度条的容器*/
@property (nonatomic, strong) NSMutableArray *bgProgresses;
@end

CGFloat   const margin    = 3;
CGFloat   const animationDuring = 1.0f;
CGFloat   const animationSpeed =  1.2f;

@implementation YYMutilCircleProgress

-(NSArray *)colors
{
    if (!_colors) {
        _colors = [NSArray array];
    }
    
    return _colors;
}
-(NSMutableArray *)progresses
{
    if (!_progresses) {
        _progresses = [NSMutableArray array];
    }
    
    return _progresses;
}
-(NSMutableArray *)bgProgresses
{
    if (!_bgProgresses) {
        _bgProgresses = [NSMutableArray array];
    }
    
    return _bgProgresses;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        

    }
    return self;
}

+(instancetype)initMutilProgressWithFrame:(CGRect)frame lineWidth:(CGFloat)lineWith
{
    
    YYMutilCircleProgress *progress = [[YYMutilCircleProgress alloc]initWithFrame:frame];
    
    progress.colors = @[[UIColor redColor],[UIColor greenColor],[UIColor blueColor]];
    
    progress.lineWidth = lineWith > 0? lineWith:15;
    
    [progress setupBackGround];
    
    [progress setupProgress];
    

    
    return progress;
}





-(void)setupBackGround
{
    
    
    for (int i = 0; i < 3; i++) {
        
        CGPoint circleCenter = CGPointMake(CGRectGetMidX(self.bounds),
                                           CGRectGetMidY(self.bounds));
        
        
        
        CGFloat redius1 = self.bounds.size.width/2-_lineWidth/2;
         CGFloat redius2 = self.bounds.size.width/2-_lineWidth/2-_lineWidth * i-margin*i;
        
        CGFloat radius = i > 0 ? redius2 : redius1;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:circleCenter
                                                            radius:radius
                                                        startAngle:-M_PI_2
                                                          endAngle:M_PI+M_PI_2
                                                         clockwise:YES];
        CAShapeLayer *shaperLayer = [CAShapeLayer layer];
        UIColor *color = _colors[i];
        shaperLayer.path = path.CGPath;
        shaperLayer.fillColor = [UIColor clearColor].CGColor;
        shaperLayer.strokeColor = color.CGColor;
        shaperLayer.lineWidth = _lineWidth;
        shaperLayer.lineCap = kCALineCapRound;
        shaperLayer.strokeStart = 0.0f;
        shaperLayer.strokeEnd = 1.0f;
        
        [self.layer addSublayer:shaperLayer];
        
        [self.bgProgresses addObject:shaperLayer];
    }
    
    
    CGPoint circleCenter = CGPointMake(CGRectGetMidX(self.bounds),
                                       CGRectGetMidY(self.bounds));
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:circleCenter
                                                        radius:self.bounds.size.width/2
                                                    startAngle:-M_PI_2
                                                      endAngle:M_PI+M_PI_2
                                                     clockwise:YES];
    CAShapeLayer *shaperLayer = [CAShapeLayer layer];
    shaperLayer.path = path.CGPath;
    shaperLayer.fillColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:0.8].CGColor;
    shaperLayer.strokeColor = [UIColor colorWithRed:120/255.0 green:120/255.0 blue:120/255.0 alpha:0.8].CGColor;
    shaperLayer.lineWidth = 1;
    shaperLayer.lineCap = kCALineCapRound;
    shaperLayer.strokeStart = 0.0f;
    shaperLayer.strokeEnd = 1.0f;
    
    [self.layer addSublayer:shaperLayer];
    
    
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:circleCenter
                                                        radius:self.bounds.size.width/2-_lineWidth*3-margin*2
                                                    startAngle:-M_PI_2
                                                      endAngle:M_PI+M_PI_2
                                                     clockwise:YES];
    CAShapeLayer *shaperLayer1 = [CAShapeLayer layer];
    shaperLayer1.path = path1.CGPath;
    shaperLayer1.fillColor = [UIColor whiteColor].CGColor;
    shaperLayer1.strokeColor = [UIColor colorWithRed:120/255.0 green:120/255.0 blue:120/255.0 alpha:0.8].CGColor;
    shaperLayer1.lineWidth = 1;
    shaperLayer1.lineCap = kCALineCapRound;
    shaperLayer1.strokeStart = 0.0f;
    shaperLayer1.strokeEnd = 1.0f;
    
    [self.layer addSublayer:shaperLayer1];
    
    
}


-(void)setupProgress
{
    for (int i = 0; i < 3; i++) {
        
        CGPoint circleCenter = CGPointMake(CGRectGetMidX(self.bounds),
                                           CGRectGetMidY(self.bounds));
        
        
        
        CGFloat redius1 = self.bounds.size.width/2-_lineWidth/2;
        CGFloat redius2 = self.bounds.size.width/2-_lineWidth/2-_lineWidth * i-margin*i;
        
        CGFloat radius = i > 0 ? redius2 : redius1;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:circleCenter
                                                            radius:radius
                                                        startAngle:-M_PI_2
                                                          endAngle:M_PI+M_PI_2
                                                         clockwise:YES];
        CAShapeLayer *shaperLayer = [CAShapeLayer layer];
        UIColor *color = _colors[i];
        shaperLayer.path = path.CGPath;
        shaperLayer.fillColor = [UIColor clearColor].CGColor;
        shaperLayer.strokeColor = color.CGColor;
        shaperLayer.lineWidth = _lineWidth;
        shaperLayer.lineCap = kCALineCapRound;
        shaperLayer.strokeStart = 0.0f;
        shaperLayer.strokeEnd = 0.0f;
        
        [self.layer addSublayer:shaperLayer];
        
        [self.progresses addObject:shaperLayer];
        
    }

}


-(void)setBigProgress:(CGFloat)bigProgress
{
    
    CAShapeLayer *shapLayer = self.progresses[0];

    CABasicAnimation *animation = [CABasicAnimation animation];
    [animation setDuration:animationDuring];
    //[animation setSpeed:animationSpeed];
    animation.fromValue = @(_bigProgress);
    animation.toValue   = @(bigProgress);
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [shapLayer addAnimation:animation forKey:@"strokeEnd"];
    
    _bigProgress = bigProgress;

    
    
    
}

-(void)setMidProgress:(CGFloat)midProgress
{
    
    
    CAShapeLayer *shapLayer = self.progresses[1];
    CABasicAnimation *animation = [CABasicAnimation animation];
    [animation setDuration:animationDuring];
    animation.fromValue = @(_midProgress);
    animation.toValue   = @(midProgress);
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [shapLayer addAnimation:animation forKey:@"strokeEnd"];
    
    _midProgress = midProgress;
    
}

-(void)setSmallProgress:(CGFloat)smallProgress
{
   
    CAShapeLayer *shapLayer = self.progresses[2];
    CABasicAnimation *animation = [CABasicAnimation animation];
    [animation setDuration:animationDuring];
    animation.fromValue = @(_smallProgress);
    animation.toValue   = @(smallProgress);
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [shapLayer addAnimation:animation forKey:@"strokeEnd"];
     _smallProgress = smallProgress;
    
}

-(void)setBigProColor:(UIColor *)bigProColor
{
    _bigProColor = bigProColor;
     CAShapeLayer *shapLayer = self.progresses[0];
     shapLayer.strokeColor = bigProColor.CGColor;
     CAShapeLayer *shapLayer1 = self.bgProgresses[0];
     shapLayer1.strokeColor = bigProColor.CGColor;

}

-(void)setMidProColor:(UIColor *)midProColor
{
    _midProColor = midProColor;
    CAShapeLayer *shapLayer = self.progresses[1];
    shapLayer.strokeColor = midProColor.CGColor;
    CAShapeLayer *shapLayer1 = self.bgProgresses[1];
    shapLayer1.strokeColor = midProColor.CGColor;
}

-(void)setSmallProColor:(UIColor *)smallProColor
{
    _smallProColor = smallProColor;
    CAShapeLayer *shapLayer = self.progresses[1];
    shapLayer.strokeColor = smallProColor.CGColor;
    CAShapeLayer *shapLayer1 = self.bgProgresses[1];
    shapLayer1.strokeColor = smallProColor.CGColor;
    
}






@end
