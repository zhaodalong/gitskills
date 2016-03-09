//
//  TSLabelBadgeValue.m
//  TSWorkingPlatform
//
//  Created by 机房 on 15/12/18.
//  Copyright (c) 2015年 ts. All rights reserved.
//

#import "TSLabelBadgeValue.h"

@implementation TSLabelBadgeValue

- (instancetype)init {

    self = [super init];

    if (self) {
        [self initilizer];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {

    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initilizer];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        [self initilizer];
    }
    return self;
}

- (void)initilizer {

    self.layer.cornerRadius = 13;
    self.textColor = [UIColor whiteColor];
    self.font = [UIFont systemFontOfSize:13];
    self.textAlignment = NSTextAlignmentCenter;
    
    self.backgroundColor = [UIColor redColor];
    self.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.layer.borderWidth =0.5;
    self.layer.masksToBounds = YES;
    
    if (self.i > 0 && self.i <= 99) {
        self.text = [NSString stringWithFormat:@"%d",self.i];
    }else if (self.i > 99) {
        self.text = @"99+";
    }
    
}

- (void)setI:(int)i {

    _i = i;
    if (self.i > 0 && self.i <= 99) {
        self.text = [NSString stringWithFormat:@"%d",self.i];
    }else if (self.i > 99) {
        self.text = @"99+";
    }

}

@end
