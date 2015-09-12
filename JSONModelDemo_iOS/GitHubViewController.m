//
//  GitHubViewController.m
//  JSONModelDemo
//
//  Created by Marin Todorov on 02/12/2012.
//  Copyright (c) 2012 Underplot ltd. All rights reserved.
//

#import "GitHubViewController.h"
#import "GitHubUserModel.h"
#import "HUD.h"

@interface GitHubViewController ()
{
    GitHubUserModel* user;
    NSArray* items;
}
@end

@implementation GitHubViewController

-(void)viewDidAppear:(BOOL)animated
{
    self.title = @"GitHub.com user lookqup";
    [HUD showUIBlockingIndicatorWithText:@"Fetching JSON"];
    //
    NSString* json = @"{\"ID\":1, \"name\":\"Marin\", \"infoNo\":\"model 1586\", \"infoDesc\":\"a short description\"}";
    
    dispatch_async(dispatch_get_main_queue(), ^{
        //code executed on the main queue
        //5
        
        user = [[GitHubUserModel alloc] initWithString:json error:NULL];
        items = @[user.info.desc, user.info.no, user.name, user.ID];
        
        [self.tableView reloadData];
        [HUD hideUIBlockingIndicator];
    });
}

#pragma mark - table methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return items.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KivaCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"KivaCell"];
    }
    
    cell.textLabel.text = [items[indexPath.row] description];
    
    if ([items[indexPath.row] isKindOfClass:[NSURL class]]) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([items[indexPath.row] isKindOfClass:[NSURL class]]) {
        [[UIApplication sharedApplication] openURL:items[indexPath.row]];
    }
}


@end
