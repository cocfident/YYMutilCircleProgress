# YYMutilCircleProgress

<br>仿apple watch 多个圆形进度条  

<br>/** 外面的进度条进度 0~1之间*/
<br>@property (nonatomic, assign) CGFloat bigProgress; 
<br>/**中间的进度条进度 0~1之间*/ 
<br>@property (nonatomic, assign) CGFloat midProgress; 
<br>/** 里面的进度条进度 0~1之间*/ 
<br>@property (nonatomic, assign) CGFloat smallProgress; 
<br>/** 外面进度条的颜色 默认红色*/ 
<br>@property (nonatomic, strong) UIColor *bigProColor; 
<br>/** 外面进度条的颜色 默认绿色*/ 
<br>@property (nonatomic, strong) UIColor *midProColor; 
<br>/** 外面进度条的颜色 默认蓝色*/ 
<br>@property (nonatomic, strong) UIColor *smallProColor; 


<br>/**
<br> *  初始化方法
 <br>*  @param frame    frame
 <br>*  @param lineWith 进度条的宽度默认为15
<br> */
<br>+(instancetype)initMutilProgressWithFrame:(CGRect)frame
<br>                                lineWidth:(CGFloat)lineWith;


![image](https://github.com/cocfident/YYMutilCircleProgress/blob/master/pic/Circle.gif)
