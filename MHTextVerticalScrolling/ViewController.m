//
//  ViewController.m
//  MHTextVerticalScrolling
//
//  Created by login on 16/2/19.
//  Copyright © 2016年 login. All rights reserved.
//

#import "ViewController.h"
#import "MHTextVerticalScrollingView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor brownColor];
    NSArray *array = @[@"我是第一条广告",@"我是第二条广告",@"我是第三条广告",@"我是第四条广告"];

    MHTextVerticalScrollingView *textView1 = [[MHTextVerticalScrollingView alloc]initWithFrame:CGRectMake(50, 50, 200, 40) VerticalScrollingMode:VerticalScrollingModeDefaultUp ContentArray:array];
    [self.view addSubview:textView1];
    
    MHTextVerticalScrollingView *textView2 = [[MHTextVerticalScrollingView alloc]initWithFrame:CGRectMake(50, 120, 200, 40) VerticalScrollingMode:VerticalScrollingModeDefaultDown ContentArray:array];
    [self.view addSubview:textView2];
    
    MHTextVerticalScrollingView *textView3 = [[MHTextVerticalScrollingView alloc]initWithFrame:CGRectMake(50, 190, 200, 40) VerticalScrollingMode:VerticalScrollingModeAlpha ContentArray:array];
    [self.view addSubview:textView3];
    
    MHTextVerticalScrollingView *textView4 = [[MHTextVerticalScrollingView alloc]initWithFrame:CGRectMake(50, 260, 200, 40) VerticalScrollingMode:VerticalScrollingModeCube ContentArray:array];
    [self.view addSubview:textView4];
    
    MHTextVerticalScrollingView *textView5 = [[MHTextVerticalScrollingView alloc]initWithFrame:CGRectMake(50, 330, 200, 40) VerticalScrollingMode:VerticalScrollingModeCubeUp ContentArray:array];
    [self.view addSubview:textView5];
    
    MHTextVerticalScrollingView *textView6 = [[MHTextVerticalScrollingView alloc]initWithFrame:CGRectMake(50, 400, 200, 40) VerticalScrollingMode:VerticalScrollingModeCubeDown ContentArray:array];
    [self.view addSubview:textView6];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
