//
//  LOLNewsDetailViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LOLNewsDetailViewController.h"

@interface LOLNewsDetailViewController ()<UIWebViewDelegate>
@property (strong, nonatomic) UIWebView *webView;
@end

@implementation LOLNewsDetailViewController
-(instancetype)init{
    if (self=[super init]) {
        self.title=@"详情";
    }
    return self;
}

-(UIWebView *)webView{
    if (_webView==nil) {
        _webView=[UIWebView new];
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_webView loadRequest:[NSURLRequest requestWithURL:_url]];
        
    }
    return _webView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate=self;
}

#pragma -mark-协议中的方法
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress];//旋转提示//框架分类里的
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    [self hideProgress];
}


@end
