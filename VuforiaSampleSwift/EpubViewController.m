//
//  EpubViewController.m
//  Infinity World
//
//  Created by nuibb on 11/29/15.
//  Copyright © 2015 nuibb. All rights reserved.
//

#import "EpubViewController.h"
#import "DocumentDirectory.h"
#import "EpubManager.h"
#import "TocOfEpub.h"

#define TOP_SPACE ([[UIScreen mainScreen] bounds].size.height == 568 ? 100 : ([[UIScreen mainScreen] bounds].size.height == 480 ? 95 : ([[UIScreen mainScreen] bounds].size.height == 667 ? 100 : ([[UIScreen mainScreen] bounds].size.height == 736 ? 130 : 150))))

@interface EpubViewController ()

@property (nonatomic, strong) EpubManager *epubManager;
@property (nonatomic, strong) DocumentDirectory *documentDirectory;
@property (nonatomic, strong) NSMutableArray *epubContent;
@property (nonatomic, strong) NSString *filePath;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSString *epubTitle;

@end

@implementation EpubViewController

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.view.superview.frame = CGRectMake(20, 40, self.view.layer.bounds.size.width - 40, self.view.layer.bounds.size.height - 80);
    
}


-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.webView = nil;
}

-(void)loadWebView {
    
    self.epubContent = [self.epubManager getEpubContents];
    
    if (_epubContextPathIndex < self.epubContent.count) {
        
        TocOfEpub *toc = self.epubContent[_epubContextPathIndex];
        
        //Loading webview with progress bar action
        if ([toc.html_link rangeOfString:@"#"].location != NSNotFound) {
            
            self.tag = [[toc.html_link stringByRemovingPercentEncoding] substringFromIndex:[[toc.html_link stringByRemovingPercentEncoding] rangeOfString:@"#"].location];
            
            self.filePath = [[NSBundle mainBundle] pathForResource:[[[[toc.html_link stringByRemovingPercentEncoding] substringToIndex:[[toc.html_link stringByRemovingPercentEncoding] rangeOfString:@"#"].location] lastPathComponent] componentsSeparatedByString:@"."][0] ofType:@"xhtml" inDirectory:@"/button_en/OEBPS/Text"];
            
        } else {
            
            self.filePath = [[NSBundle mainBundle] pathForResource:[[toc.html_link lastPathComponent] componentsSeparatedByString:@"."][0] ofType:@"xhtml" inDirectory:@"/button_en/OEBPS/Text"];
            
        }

        NSURL *url = [NSURL fileURLWithPath:self.filePath];
        [_webView loadRequest:[NSURLRequest requestWithURL:url]];
        
    }
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
        [self loadWebView];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Do any additional setup after loading the view.
    
    self.documentDirectory = [DocumentDirectory new];
    self.epubManager = [[EpubManager alloc] initWithIdentifier:self.epubType];

    self.webView.delegate = self;
    //  self.webView.mediaPlaybackRequiresUserAction = NO;
    [self.view addSubview:self.webView];
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    
    if (self.tag) {
        [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"window.location.hash='%@'", self.tag]];
    }
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    //Dispose of any resources that can be recreated.
}

- (IBAction)btnEventListener:(id)sender {
    
    [self.delegate backBtnVisibility];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

@end
