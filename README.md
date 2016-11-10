# MHTextVerticalScrollingView
垂直方向的滚动文本
以数组的形式将需要显示的内容传入

![](https://github.com/MacocoH/MHTextVerticalScrollingView/blob/master/Screen.gif)
# 调用方法      
    MHTextVerticalScrollingView *textView = [[MHTextVerticalScrollingView alloc]initWithFrame:CGRectMake(50, 150, 200, 40) VerticalScrollingMode:VerticalScrollingModeAlpha ContentArray:array];
    [self.view addSubview:textView];
需要引用MHTextVerticalScrollingView.h文件     
## 动画样式
    typedef NS_OPTIONS(NSInteger,VerticalScrollingMode) {
    VerticalScrollingModeDefaultUp   = 1 << 0,
    VerticalScrollingModeDefaultDown = 1 << 1,
    VerticalScrollingModeCube        = 1 << 2,
    VerticalScrollingModeCubeUp      = 1 << 3,
    VerticalScrollingModeCubeDown    = 1 << 4,
    VerticalScrollingModeAlpha       = 1 << 5,
    };
## 默认样式
    self.backgroundColor = [UIColor whiteColor];
    self.vsFont = 20;
    self.vsColor = [UIColor blackColor];
    self.vsTextAlignment = NSTextAlignmentCenter;
## 支持属性
    @property (nonatomic,assign) NSInteger vsFont;//字号
    @property (nonatomic,retain) UIColor *vsColor;//颜色
    @property (nonatomic,assign) NSTextAlignment vsTextAlignment;//排版样式

