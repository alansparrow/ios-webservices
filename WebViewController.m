//
//  WebViewController.m
//  Nerdfeed
//
//  Created by Alan Sparrow on 12/31/13.
//  Copyright (c) 2013 Alan Sparrow. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    NSLog(@"%f %f", [[UIScreen mainScreen] applicationFrame].size.width,
          [[UIScreen mainScreen] applicationFrame].size.height);
    UIToolbar *webToolBar = [[UIToolbar alloc]
                             initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - 44,
                                                      [[UIScreen mainScreen] bounds].size.width, 44)];
    backBtn = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain
                                                                  target:self action:@selector(back)];
    forwardBtn = [[UIBarButtonItem alloc] initWithTitle:@"Forward" style:UIBarButtonItemStylePlain
                                                                  target:self action:@selector(forward)];
    [webToolBar setItems:[NSArray arrayWithObjects:backBtn, forwardBtn, nil] animated:YES];
    [self updateBarButton];
    

    [[self webView] addSubview:webToolBar];

}

- (void)forward
{
    [[self webView] goForward];

}

- (void)back
{
    [[self webView] goBack];

}

- (void)updateBarButton
{
    [forwardBtn setEnabled:[[self webView] canGoForward]];
    NSLog(@"Forward ? %d", [[self webView] canGoForward]);
    [backBtn setEnabled:[[self webView] canGoBack]];
    NSLog(@"Back ? %d", [[self webView] canGoBack]);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self updateBarButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView
{
    // Create an instance of UIWebView as large as the screen
    CGRect screenFrame = [[UIScreen mainScreen] applicationFrame];
    UIWebView *wv = [[UIWebView alloc] initWithFrame:screenFrame];
    
    // Tell web view to scale web content to fit within bounds
    // of webview
    [wv setScalesPageToFit:YES];
    
    [wv setDelegate:self];
    
    [self setView:wv];
}


- (UIWebView *)webView
{
    return (UIWebView *)[self view];
}

@end
