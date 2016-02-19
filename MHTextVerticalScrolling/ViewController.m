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
    NSArray *array = @[@"aaaaaa",@"bbbbbbb",@"ccccccc",@"dddddddd"];

    MHTextVerticalScrollingView *textView = [[MHTextVerticalScrollingView alloc]initWithFrame:CGRectMake(50, 150, 200, 40) VerticalScrollingMode:VerticalScrollingModeAlpha ContentArray:array];
    [self.view addSubview:textView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
