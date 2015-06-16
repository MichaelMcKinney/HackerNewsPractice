//
//  DetailViewController.m
//  HackerNews
//
//  Created by Michael McKinney on 6/8/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController

- (void)viewDidLoad //initializes the webview
{
    [self refreshUI];
    [super viewDidLoad];
    
    self.webView.scalesPageToFit = YES;
    self.webView.delegate = self;
}

- (void)webViewDidStartLoad:(UIWebView *)webView //starts animating the spinner
{
    [self.activity startAnimating];
    self.activity.hidden = NO;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView //stops animating the spinner
{
    [self.activity stopAnimating];
    self.activity.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)setupStoryValue:(Story *)story //initialize the story to display
{
    _viewModel = DetailViewModel.new;
    
    [_viewModel setupStory:story];
    [self refreshUI];
}

-(void)refreshUI//load in the url from the story to the UIwebview
{
    if ([_viewModel.story.type  isEqualToString:@"job"])
    {
        [self.webView loadHTMLString:[_viewModel getText] baseURL:nil];
    }
    else
    {
        NSURLRequest *request = [NSURLRequest requestWithURL:[_viewModel getURL]];
        [self.webView loadRequest:request];
    }
}

-(void)selectedStory:(Story *)story //assign story value
{
    [self setupStoryValue:story];
}

@end
