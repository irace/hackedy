//
//  HCKRNewsViewController.m
//  Hackedy
//
//  Created by Bryan Irace on 1/8/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

#import "HCKRAPIClient.h"
#import "HCKRPost.h"
#import "HCKRNewsViewController.h"
#import "HCKRPostViewController.h"
#import "NSArray+Blocks.h"

static NSString * const CellIdentifier = @"CellIdentifier";

@interface HCKRNewsViewController ()

@property (nonatomic) HCKRAPIClient *client;
@property (nonatomic) NSArray *posts;

@end

@implementation HCKRNewsViewController

#pragma mark - Initialization

- (id)init {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _client = [[HCKRAPIClient alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    return [self init];
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.client news:^(NSArray *posts, NSError *error) {
        self.posts = [posts transformedArrayUsingBlock:^HCKRPost *(NSDictionary *postDictionary) {
            return [[HCKRPost alloc] initWithDictionary:postDictionary];
        }];
        
        [self.tableView reloadData];
    }];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.posts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HCKRPost *post = self.posts[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.text = post.title;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HCKRPost *post = self.posts[indexPath.row];

    [self.navigationController pushViewController:[[HCKRPostViewController alloc] initWithPost:post] animated:YES];
}

@end
