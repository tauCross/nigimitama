//
//  NGViewController.h
//  nigimitama
//
//  Created by tauCross on 2018/7/2.
//  Copyright © 2018年 tc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <NICellFactory.h>
#import <NIMutableTableViewModel.h>



@interface NGViewController : UIViewController <UITableViewDelegate>

@property(nonatomic, strong)UIView *contentView;
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NIMutableTableViewModel *tableModel;

- (void)loadUI;
- (void)layoutUI;
- (void)loadData;
- (void)loadDataFromServer;
- (void)onReceiveApplicationDidBecomeActiveNotification;
- (UITableViewStyle)tableViewStyle;
- (void)back;
- (void)close;
- (BOOL)prefersNavigationBarHidden;

@end
