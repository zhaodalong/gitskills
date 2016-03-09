//
//  ViewController.m
//  CreateBtn
//
//  Created by 机房 on 15/12/11.
//  Copyright (c) 2015年 ts. All rights reserved.
//

#import "ViewController.h"
#import "AddBtnView.h"
#import "TSLabelBadgeValue.h"

@interface ViewController ()

@property (strong, nonatomic) TSLabelBadgeValue *value;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AddBtnView *addView = [[AddBtnView alloc]initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, 20)];
    [self.view addSubview:addView];
    
    TSLabelBadgeValue *value = [[TSLabelBadgeValue alloc]initWithFrame:CGRectMake(80, 80, 25, 25)];
    self.value = value;
    value.i = 20;
    [self.view addSubview:value];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(dismissLabel:)];
    [self.view addGestureRecognizer:pan];
    
}

- (void)dismissLabel:(UIPanGestureRecognizer *)pan {

    CGPoint position = [pan locationInView:self.view];
    CGPoint translation = [pan translationInView:self.view];
    CGPoint center = self.value.center;
    center.x += translation.x;
    center.y += translation.y;
    self.value.center = center;
    [pan setTranslation:CGPointZero inView:self.view];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
