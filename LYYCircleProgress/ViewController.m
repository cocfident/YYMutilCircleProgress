//
//  ViewController.m
//  LYYCircleProgress
//
//  Created by Xiaoyue on 16/6/15.
//  Copyright © 2016年 李运洋. All rights reserved.
//

#import "ViewController.h"
#import "YYMutilCircleProgress.h"
@interface ViewController ()

/** <#注释#>*/
@property (nonatomic, strong)  YYMutilCircleProgress *progress;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    _progress = [YYMutilCircleProgress initMutilProgressWithFrame:CGRectMake(0, 0, 200, 200) lineWidth:15];
    _progress.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
    [self.view addSubview:_progress];
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    _progress.bigProgress = 0.9f;
    _progress.midProgress = 0.9f;
    _progress.smallProgress = 0.9f;
    
//    _progress.bigProgress = arc4random()%100/100.f;
//    _progress.midProgress = arc4random()%100/100.f;
//    _progress.smallProgress = arc4random()%100/100.f;
}

@end
