//
//  YYMutilCircleProgress.h
//  LYYCircleProgress
//
//  Created by Xiaoyue on 16/6/15.
//  Copyright © 2016年 李运洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYMutilCircleProgress : UIView
/** 外面的进度条进度 0~1之间*/
@property (nonatomic, assign) CGFloat bigProgress;
/**中间的进度条进度 0~1之间*/
@property (nonatomic, assign) CGFloat midProgress;
/** 里面的进度条进度 0~1之间*/
@property (nonatomic, assign) CGFloat smallProgress;
/** 外面进度条的颜色 默认红色*/
@property (nonatomic, strong) UIColor *bigProColor;
/** 外面进度条的颜色 默认绿色*/
@property (nonatomic, strong) UIColor *midProColor;
/** 外面进度条的颜色 默认蓝色*/
@property (nonatomic, strong) UIColor *smallProColor;


/**
 *  初始化方法
 *
 *  @param frame    frame
 *  @param lineWith 进度条的宽度默认为15
 */
+(instancetype)initMutilProgressWithFrame:(CGRect)frame
                                lineWidth:(CGFloat)lineWith;



@end
