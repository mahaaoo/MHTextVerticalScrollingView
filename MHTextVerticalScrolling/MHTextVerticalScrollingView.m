//
//  MHTextVerticalScrollingView.m
//  MHTextVerticalScrolling
//
//  Created by login on 16/2/19.
//  Copyright © 2016年 login. All rights reserved.
//

#import "MHTextVerticalScrollingView.h"
#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height
@interface MHTextVerticalScrollingView ()
@property (nonatomic,copy) NSArray *titleList;
@property (nonatomic,retain) UILabel *showView;
@property (nonatomic,retain) UILabel *nextView;
@property (nonatomic,assign) CGRect startRect;
@property (nonatomic,assign) CGRect showRect;
@property (nonatomic,assign) CGRect endRect;
@property (nonatomic,assign) CGFloat offset;
@property (nonatomic,assign) NSInteger number;
@end

NSInteger count = 1;

@implementation MHTextVerticalScrollingView

- (instancetype)initWithFrame:(CGRect)frame VerticalScrollingMode:(VerticalScrollingMode)mode ContentArray:(NSArray *)contentArray {
    self = [super initWithFrame:frame];
    if (self) {
        self.showRect = CGRectMake(0, 0, WIDTH, HEIGHT);
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        self.vsFont = 20;
        self.vsColor = [UIColor blackColor];
        self.vsTextAlignment = NSTextAlignmentCenter;
        self.number = 1;
        
        if (contentArray == nil || contentArray.count == 0) {
            
        }else if (contentArray != nil && contentArray.count == 1) {
            
            NSMutableArray *mutableArray = [[NSMutableArray alloc]init];
            [mutableArray addObject:contentArray[0]];
            [mutableArray addObject:contentArray[0]];
            
            self.titleList = [mutableArray copy];
        }else if (contentArray != nil && contentArray.count > 1) {
            
            self.titleList = [contentArray copy];
            
            switch (mode) {
                case VerticalScrollingModeDefaultUp: {
                    [self setRectVerticalScrollingModeDefaultUp];
                    [self timerForVerticalScrollingModelDeatult];
                }
                    break;
                case VerticalScrollingModeDefaultDown: {
                    [self setRectVerticalScrollingModeDefaultDown];
                    [self timerForVerticalScrollingModelDeatult];
                }
                    break;
                case VerticalScrollingModeCubeUp: {
                    [self setOffsetForVerticalScrollingModeCubeUp];
                    [self timerForVerticalScrollingModelCube];
                }
                    break;
                case VerticalScrollingModeCubeDown: {
                    [self setOffsetForVerticalScrollingModeCubeDown];
                    [self timerForVerticalScrollingModelCube];
                }
                    break;
                case VerticalScrollingModeCube: {
                    [self setOffsetForVerticalScrollingModeCube];
                    [self timerForVerticalScrollingModelCube];
                }
                    break;
                case VerticalScrollingModeAlpha: {
                    [self timerForVerticalScrollingModeAlpha];
                }
                    break;

                default:
                    break;
            }
        }
    }
    return self;
}
#pragma mark - 设置属性
- (void)setVsFont:(NSInteger)vsFont {
    _vsFont = vsFont;
    self.showView.font = [UIFont systemFontOfSize:self.vsFont];
    self.nextView.font = [UIFont systemFontOfSize:self.vsFont];
}
- (void)setVsColor:(UIColor *)vsColor {
    _vsColor = vsColor;
    self.showView.textColor = self.vsColor;
    self.nextView.textColor = self.vsColor;
}
- (void)setVsTextAlignment:(NSTextAlignment)vsTextAlignment {
    _vsTextAlignment = vsTextAlignment;
    self.showView.textAlignment = self.vsTextAlignment;
    self.nextView.textAlignment = self.vsTextAlignment;
}
- (UILabel *)creatLabelWithFrame:(CGRect)frame {
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.textAlignment = self.vsTextAlignment;
    label.textColor = self.vsColor;
    label.font = [UIFont systemFontOfSize:self.vsFont];
    return label;
}
- (void)changeArray {
    NSMutableArray *muArray = [NSMutableArray array];
    muArray = [self.titleList mutableCopy];
    
    NSString *string = self.titleList[0];
    [muArray removeObjectAtIndex:0];
    [muArray insertObject:string atIndex:self.titleList.count - 1];
    
    self.titleList = [muArray copy];
}

#pragma mark - VerticalScrollingModeDefault
- (void)timerForVerticalScrollingModelDeatult {
    
    self.showView = [self creatLabelWithFrame:self.showRect];
    self.showView.text = self.titleList[0];
    [self changeArray];
    NSLog(@"%@",self.titleList[0]);
    [self addSubview:self.showView];
    
    self.nextView = [self creatLabelWithFrame:self.startRect];
    self.nextView.text = self.titleList[0];
    [self changeArray];
    NSLog(@"%@",self.titleList[0]);
    [self addSubview:self.nextView];
    
    NSTimer *defaultTimer = [NSTimer timerWithTimeInterval:3.5f target:self selector:@selector(startDefaultAnimation) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:defaultTimer forMode:NSDefaultRunLoopMode];
}
- (void)startDefaultAnimation {
    [UIView animateWithDuration:2.0f animations:^{
        self.showView.frame = self.endRect;
        self.nextView.frame = self.showRect;
    } completion:^(BOOL finished) {
        self.showView.frame = self.startRect;
        self.showView.text = self.titleList[0];
        [self changeArray];
        UILabel *label = self.showView;
        self.showView = self.nextView;
        self.nextView = label;
    }];
}
#pragma mark - VerticalScrollingModeDefaultUP
- (void)setRectVerticalScrollingModeDefaultUp {
    self.startRect = CGRectMake(0, HEIGHT, WIDTH, HEIGHT);
    self.endRect = CGRectMake(0, - HEIGHT, WIDTH, HEIGHT);
}
#pragma mark - VerticalScrollingModeDefaultDown
- (void)setRectVerticalScrollingModeDefaultDown {
    self.endRect = CGRectMake(0, HEIGHT, WIDTH, HEIGHT);
    self.startRect = CGRectMake(0, - HEIGHT, WIDTH, HEIGHT);
}
#pragma mark - VerticalScrollingModeCube
- (void)timerForVerticalScrollingModelCube {
    self.showView = [self creatLabelWithFrame:self.showRect];
    self.showView.text = self.titleList[0];
    self.showView.alpha = 1.0f;
    [self addSubview:self.showView];
    
    self.nextView = [self creatLabelWithFrame:self.showRect];
    self.nextView.text = self.titleList[1];
    self.nextView.alpha = 0.0f;
    [self addSubview:self.nextView];

    NSTimer *defaultTimer = [NSTimer timerWithTimeInterval:3.5f target:self selector:@selector(startCubeAnimation) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:defaultTimer forMode:NSDefaultRunLoopMode];
}
- (void)startCubeAnimation {
    
    self.nextView.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1, 0), CGAffineTransformMakeTranslation(0, self.offset));
    CGAffineTransform transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1, 0.05), CGAffineTransformMakeTranslation(0, -self.offset));
    
    [UIView animateWithDuration:2 animations:^{
        self.nextView.alpha = 1;
        self.showView.alpha = 0;
        self.nextView.transform = CGAffineTransformIdentity;
        self.showView.transform = transform;
        
    } completion:^(BOOL finished) {
        if (self.showView) {
            [self.showView removeFromSuperview];
        }
        self.showView = [self creatLabelWithFrame:self.showRect];
        self.showView.text = self.titleList[count];
        self.showView.alpha = 0.0f;
        [self addSubview:self.showView];
        
        UILabel *lae = self.showView;
        self.showView = self.nextView;
        self.nextView = lae;
    }];
    
    count ++;
    if (count >= self.titleList.count) {
        count = 0;
    }
}
#pragma mark - VerticalScrollingModeCubeUp
- (void)setOffsetForVerticalScrollingModeCubeUp {
    self.offset = self.vsFont/2;
}
#pragma mark - VerticalScrollingModeCubeDown
- (void)setOffsetForVerticalScrollingModeCubeDown {
    self.offset = -self.vsFont/2;
}
#pragma mark - VerticalScrollingModeCube
- (void)setOffsetForVerticalScrollingModeCube {
    self.offset = 0;
}
#pragma mark - VerticalScrollingModeAlpha
- (void)timerForVerticalScrollingModeAlpha {
    self.showView = [self creatLabelWithFrame:self.showRect];
    self.showView.text = self.titleList[0];
    [self changeArray];
    self.showView.alpha = 1.0f;
    [self addSubview:self.showView];
    
    self.nextView = [self creatLabelWithFrame:self.showRect];
    self.nextView.text = self.titleList[1];
    [self changeArray];
    self.nextView.alpha = 0.0f;
    [self addSubview:self.nextView];
    
    NSTimer *defaultTimer = [NSTimer timerWithTimeInterval:3.5f target:self selector:@selector(startAlphaAnimation) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:defaultTimer forMode:NSDefaultRunLoopMode];
}
- (void)startAlphaAnimation {
    
    [UIView animateWithDuration:2 animations:^{
        self.nextView.alpha = 1;
        self.showView.alpha = 0;
    } completion:^(BOOL finished) {
        if (self.showView) {
            [self.showView removeFromSuperview];
        }
        self.showView = [self creatLabelWithFrame:self.showRect];
        self.showView.text = self.titleList[0];
        [self changeArray];
        self.showView.alpha = 0.0f;
        [self addSubview:self.showView];
        
        UILabel *lae = self.showView;
        self.showView = self.nextView;
        self.nextView = lae;
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
