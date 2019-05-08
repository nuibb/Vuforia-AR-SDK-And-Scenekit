//
//  EpubViewController.h
//  Infinity World
//
//  Created by nuibb on 11/29/15.
//  Copyright © 2015 nuibb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@protocol DelegateForButtonVisibility;

@interface EpubViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, weak) IBOutlet id <DelegateForButtonVisibility>delegate;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property NSInteger epubContextPathIndex;
@property (nonatomic, strong) NSString *epubType;
- (IBAction)btnEventListener:(id)sender;

@end


#pragma mark - Delegate For Language
@protocol DelegateForButtonVisibility <NSObject>

@required
-(void)backBtnVisibility;

@end
