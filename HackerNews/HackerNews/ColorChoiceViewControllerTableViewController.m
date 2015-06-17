//
//  ColorChoiceViewControllerTableViewController.m
//  HackerNews
//
//  Created by Michael McKinney on 6/10/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import "ColorChoiceViewControllerTableViewController.h"
#import "ThemeManager.h"


@interface ColorChoiceViewControllerTableViewController ()

@end

@implementation ColorChoiceViewControllerTableViewController

- (void)viewDidLoad
{
    _viewModel = ColorChoiceViewModel.new;
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _viewModel.sections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _viewModel.rows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"colorCell" forIndexPath:indexPath];
    NSString* Hex = [_viewModel StringAtIndex:indexPath.row];
    cell.backgroundColor = [ColorUtil colorFromHexString:Hex];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_viewModel selectedColor:indexPath.row];
    [self dismissViewControllerAnimated:YES completion:^{}];
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"reloadView" object:nil];
}

@end
