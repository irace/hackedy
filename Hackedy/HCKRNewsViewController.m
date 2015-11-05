//
//  HCKRNewsViewController.m
//  Hackedy
//
//  Created by Bryan Irace on 1/8/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

#import "HCKRAPIClient.h"
#import "HCKRItem.h"
#import "HCKRNewsViewController.h"
#import "HCKRNewsTableViewCell.h"
#import "HCKRItemViewController.h"
#import "NSArray+Blocks.h"

static NSString * const CellIdentifier = @"CellIdentifier";

@interface HCKRNewsViewController ()

@property (nonatomic) HCKRAPIClient *client;
@property (nonatomic) NSArray *items;

@end

@implementation HCKRNewsViewController

#pragma mark - Initialization

- (id)init {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _client = [[HCKRAPIClient alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settings"]
                                                                                 style:UIBarButtonItemStylePlain target:nil action:nil];
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    return [self init];
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [HCKRColors backgroundColor];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.tintColor = [HCKRColors tintColor];
    [self.refreshControl addTarget:self action:@selector(fetchNews) forControlEvents:UIControlEventValueChanged];
    
    [self.tableView registerClass:[HCKRNewsTableViewCell class] forCellReuseIdentifier:CellIdentifier];
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.rowHeight = 50;
    
    [self fetchNews];
}

#pragma mark - Private

- (void)fetchNews {
    [self.refreshControl beginRefreshing];
    
    [self.client news:^(NSArray *items, NSError *error) {
        if (!error) {
            self.items = [items transformedArrayUsingBlock:^HCKRItem *(NSDictionary *itemDictionary) {
                return [[HCKRItem alloc] initWithDictionary:itemDictionary];
            }];
            
            [self.tableView reloadData];
        }
        
        [self.refreshControl endRefreshing];
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HCKRItem *item = self.items[indexPath.row];
    
    HCKRNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = item.domain;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HCKRItem *item = self.items[indexPath.row];

    [self.navigationController pushViewController:[[HCKRItemViewController alloc] initWithItem:item] animated:YES];
}

@end
