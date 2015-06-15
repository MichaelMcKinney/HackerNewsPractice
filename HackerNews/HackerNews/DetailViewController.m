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
    
    //NSLog(@"DetailViewDidLoad");
    [self refreshUI];
    [super viewDidLoad];
    self.webView.scalesPageToFit = YES;
    self.webView.delegate = self;
    
    //self.middleLabel.text = @"No Story Selected";
    //self.middleLabel.font = [UIFont systemFontOfSize:30];
    //self.webView.contentMode = UIViewContentModeScaleAspectFit;
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
    // Dispose of any resources that can be recreated.
}

-(void)setupStoryValue:(Story *)story //initialize the story to display
{
    //NSLog(@"settingStory");
    if (self.story != story)
        {self.story = story;}
    [self refreshUI];
}

-(void)refreshUI//load in the url from the story to the UIwebview
{
    if (self.story.ID==0)
    {
        //NSLog(@"ref ONE");

        self.titleLabel.text = @"";
        
        //self.webView.alpha=0;
        return;
    }
    else
    {
        self.webView.alpha=1;

        self.middleLabel.text = @"";
        //NSLog(@"ref TWO");
        
        if ([self.story.type  isEqualToString:@"job"])
        {
            //NSLog([NSString stringWithFormat:@"%@",self.story.url]);
            //NSLog([NSString stringWithFormat:@"%@",self.story.text]);
            [self.webView loadHTMLString:self.story.text baseURL:nil];
            
        }
        else
        {
           // NSLog(@"refreshUI");
            NSURLRequest *request = [NSURLRequest requestWithURL:self.story.url];
            [self.webView loadRequest:request];
        }
        
        return;
    }
     
}

-(void)selectedStory:(Story *)story //assign story value
{
    [self setupStoryValue:story];
}

@end
