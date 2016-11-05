//
//  ViewController.h
//  WebViewDemo
//
//  Created by HOCVIEN on 10/10/15.
//  Copyright (c) 2015 HOCVIEN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *myWebView;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
- (IBAction)goButtonTapped:(UIButton *)sender;
- (IBAction)backButtonTapped:(id)sender;
- (IBAction)nextButtonTapped:(UIButton *)sender;
- (IBAction)refressTapped:(id)sender;


@end

