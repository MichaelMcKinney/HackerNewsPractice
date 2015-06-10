//
//  DetailViewController.m
//  HackerNews
//
//  Created by Michael McKinney on 6/8/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController
- (void)viewDidLoad {
    
    //NSLog(@"DetailViewDidLoad");
    [self refreshUI];
    [super viewDidLoad];
    self.webView.scalesPageToFit = YES;
    //self.webView.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)didReceiveMemoryWarning

{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupStoryValue:(Story *)story
{
    //NSLog(@"settingStory");
    if (self.story != story)
        {self.story = story;}
    [self refreshUI];
}

-(void)refreshUI
{
    if (self.story.ID==0)
    {
        //NSLog(@"ref ONE");

        self.titleLabel.text = @"";
        self.middleLabel.text = @"No Story Selected";
        self.middleLabel.font = [UIFont systemFontOfSize:30];
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

-(void)selectedStory:(Story *)story
{
    [self setupStoryValue:story];
}

@end
