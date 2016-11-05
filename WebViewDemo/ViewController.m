//
//  ViewController.m
//  WebViewDemo
//
//  Created by HOCVIEN on 10/10/15.
//  Copyright (c) 2015 HOCVIEN. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController () <UITextFieldDelegate, UIWebViewDelegate>
{
    NSString *string;
    NSString *googleSearch;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myTextField.delegate = self;
    self.myWebView.delegate = self;
    
    string = @"http://";
    googleSearch = @"https://www.google.com.vn/search?q=";
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    
    [self.view addGestureRecognizer:tapGesture];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewTapped:(UITapGestureRecognizer *)gesture{
    [self.myTextField endEditing:YES];
}

- (IBAction)goButtonTapped:(UIButton *)sender {
    if (([self.myTextField.text containsString:@"."]) && (![self.myTextField.text containsString:@" "])) {
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@", self.myTextField.text]];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        [self.myWebView loadRequest:request];
        
//    if ([string rangeOfString:self.myTextField.text].location==0) {
//        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@", self.myTextField.text]];
//        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
//        [self.myWebView loadRequest:request];
    } else {
        NSString *searchString = [googleSearch stringByAppendingString:[self.myTextField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSURL *url = [NSURL URLWithString:searchString];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        [self.myWebView loadRequest:request];
    }
    
    
}
- (IBAction)backButtonTapped:(id)sender {
    [self.myWebView goBack];
}

- (IBAction)nextButtonTapped:(UIButton *)sender {
    [self.myWebView goForward];
}

- (IBAction)refressTapped:(id)sender {
    [self.myWebView reload];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    self.myTextField.text = webView.request.URL.absoluteString;
}

- (void) webViewDidFinishLoad:(UIWebView *)webView{
    NSString *javascript = @"document.body.outerHTML;";
    
    NSString *html = [self.myWebView stringByEvaluatingJavaScriptFromString:javascript];
    NSLog(@"html %@",html);
}


@end
