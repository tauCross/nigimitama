//
//  NGViewController.m
//  nigimitama
//
//  Created by tauCross on 2018/7/2.
//  Copyright © 2018年 tc. All rights reserved.
//

#import "NGViewController.h"



@interface NGViewController ()

@end


@implementation NGViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self _loadUI];
    [self loadUI];
    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:[self prefersNavigationBarHidden] animated:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self _layoutUI];
    [self layoutUI];
}

- (void)_loadUI
{
    self.contentView = [[UIView alloc] init];
    self.contentView.backgroundColor = HEXCOLOR(@"F7F7F7");
    [self.view addSubview:self.contentView];
    {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:[self tableViewStyle]];
        self.tableView.tableHeaderView = [[UIView alloc] init];
        self.tableView.tableFooterView = [[UIView alloc] init];
        self.tableView.backgroundColor = [UIColor clearColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.delegate = self;
        [self.contentView addSubview:self.tableView];
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
    }
    self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
}

- (void)_layoutUI
{
    self.contentView.frame = self.view.bounds;
    {
        self.tableView.frame = self.contentView.bounds;
    }
}

- (void)loadUI{};
- (void)layoutUI{};
- (void)loadData{};
- (void)loadDataFromServer{};
- (void)onReceiveApplicationDidBecomeActiveNotification{};
- (UITableViewStyle)tableViewStyle{return UITableViewStylePlain;}
- (void)back{[self.navigationController popViewControllerAnimated:YES];};
- (void)close{if(self.navigationController) [self.navigationController dismissViewControllerAnimated:YES completion:nil]; else [self dismissViewControllerAnimated:YES completion:nil];};
- (BOOL)prefersStatusBarHidden{return NO;}
- (UIStatusBarStyle)preferredStatusBarStyle{return UIStatusBarStyleDefault;}
- (BOOL)prefersNavigationBarHidden{return NO;}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [NICellFactory tableView:tableView heightForRowAtIndexPath:indexPath model:(NITableViewModel *)tableView.dataSource];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
