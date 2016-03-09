//
//  AddBtnView.m
//  CreateBtn
//
//  Created by 机房 on 15/12/11.
//  Copyright (c) 2015年 ts. All rights reserved.
//

#import "AddBtnView.h"

#define btnW  50
#define btnH  30
#define btnCount  5

@implementation AddBtnView

- (NSMutableArray *)allBtn {

    if (!_allBtn) {
        _allBtn = [NSMutableArray arrayWithCapacity:0];
    }
    return _allBtn;
}

- (instancetype)init {

    self = [super init];
    if (self) {
        
        [self initilizer];
        [self addBtn];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        [self initilizer];
        [self addBtn];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {

    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initilizer];
        [self addBtn];
    }
    return self;
}

- (void)initilizer {

    self.pressImageNames = @[@"1_1.png",@"2_1.png",@"5_1.png",@"50_1.png",@"100_1.png"];
    self.normalImageNames = @[@"1_2.png",@"2_2.png",@"5_2.png",@"50_2.png",@"100_2.png"];

}

- (void)addBtn {

    for (int i = 0; i < self.normalImageNames.count; i ++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:self.normalImageNames[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:self.pressImageNames[i]] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        //边距
        int row = i/btnCount;
        int column = i%btnCount;
        CGFloat margin = (self.frame.size.width - btnCount*btnW)/(btnCount+1);
        CGFloat btnX = margin+(btnW+margin)*column;
        CGFloat btnY = row*(btnH+margin);
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [self addSubview:btn];
        [self.allBtn addObject:btn];
    }

}

- (void)clickBtn:(UIButton *)bt {

    bt.selected = !bt.selected;
    NSLog(@"sdfsdfsdfsdfsdfsdfsdfdsfsdfsdf");

}

@end
