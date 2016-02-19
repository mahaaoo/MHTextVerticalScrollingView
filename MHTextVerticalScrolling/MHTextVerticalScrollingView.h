//
//  MHTextVerticalScrollingView.h
//  MHTextVerticalScrolling
//
//  Created by login on 16/2/19.
//  Copyright © 2016年 login. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger,VerticalScrollingMode) {
    VerticalScrollingModeDefaultUp   = 1 << 0,
    VerticalScrollingModeDefaultDown = 1 << 1,
    VerticalScrollingModeCube        = 1 << 2,
    VerticalScrollingModeCubeUp      = 1 << 3,
    VerticalScrollingModeCubeDown    = 1 << 4,
    VerticalScrollingModeAlpha       = 1 << 5,
};

@interface MHTextVerticalScrollingView : UIView
/**
 *  字体大小 默认20
 */
@property (nonatomic,assign) NSInteger vsFont;
/**
 *  字体颜色 默认黑色
 */
@property (nonatomic,retain) UIColor *vsColor;
/**
 *  字体布局 默认居中
 */
@property (nonatomic,assign) NSTextAlignment vsTextAlignment;
/**
 *  初始化
 *
 *  @param frame        frame
 *  @param mode         动画类型
 *  @param contentArray 标题数组
 *
 *  @return self
 */
- (instancetype)initWithFrame:(CGRect)frame VerticalScrollingMode:(VerticalScrollingMode)mode ContentArray:(NSArray *)contentArray;
@end
