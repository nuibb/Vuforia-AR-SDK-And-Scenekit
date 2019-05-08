//
//  ARBottomButtons.m
//  AR
//
//  Created by nuibb on 3/21/16.
//  Copyright © 2016 nuibb. All rights reserved.
//

#import "ARBottomButtons.h"

@implementation ARBottomButtons

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

#pragma mark - Custom Row Contents For Settings View

- (IBAction)backBtnEventListener:(id)sender {
    [self.delegateForBottomBtns backBtnEventListener];
}

- (UIButton *) addButtonsAtBottom:(UIView *)parentView {
    
    UIButton *backBtn = [[UIButton alloc] init];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"ar-back-tab"] forState:UIControlStateNormal];
    //[languageBtn setBackgroundImage:[UIImage imageNamed:@"lan_focus.png"] forState:UIControlStateHighlighted];
    backBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [backBtn addTarget:self action:@selector(backBtnEventListener:) forControlEvents:UIControlEventTouchUpInside];
    [parentView addSubview:backBtn];
    
    [parentView  addConstraint:[NSLayoutConstraint constraintWithItem:backBtn
                                                            attribute:NSLayoutAttributeCenterX
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:parentView
                                                            attribute:NSLayoutAttributeCenterX
                                                           multiplier:1
                                                             constant:0]];
    
    [parentView addConstraint:[NSLayoutConstraint constraintWithItem:backBtn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeBottom multiplier:1 constant:-20]];
    
    [parentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[backBtn(==60)]"
                                                                       options:0
                                                                       metrics:nil
                                                                         views:NSDictionaryOfVariableBindings(backBtn)]];
    
    [parentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[backBtn(==60)]"
                                                                       options:0
                                                                       metrics:nil
                                                                         views:NSDictionaryOfVariableBindings(backBtn)]];

    return backBtn;
}

@end
