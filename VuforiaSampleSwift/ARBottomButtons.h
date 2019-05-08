//
//  ARBottomButtons.h
//  AR
//
//  Created by nuibb on 3/21/16.
//  Copyright © 2016 nuibb. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DelegateForBottomButtons;

@interface ARBottomButtons : UIView

@property (nonatomic, weak) IBOutlet id <DelegateForBottomButtons>delegateForBottomBtns;
-(UIButton *)addButtonsAtBottom:(UIView *)parentView;

@end


#pragma mark - Delegate For Language
@protocol DelegateForBottomButtons <NSObject>

@required
-(void)backBtnEventListener;

@end
