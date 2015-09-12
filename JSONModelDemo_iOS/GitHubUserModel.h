//
//  GitHubUserModel.h
//  JSONModelDemo
//
//  Created by Marin Todorov on 02/12/2012.
//  Copyright (c) 2012 Underplot ltd. All rights reserved.
//

#import "JSONModel.h"

@interface GitHubUserInfo : JSONModel
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *no;
@end

@interface GitHubUserModel : JSONModel

////@property (strong, nonatomic) NSString* login;
////@property (strong, nonatomic) NSURL* html_url;
@property (strong, nonatomic) NSString* ID;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) GitHubUserInfo *info;

@end
