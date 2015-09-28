//
//  ViewController.m
//  Demo
//
//  Created by bartx on 15/9/25.
//  Copyright © 2015年 bartx. All rights reserved.
//

#import "ViewController.h"
#import "BBTableView.h"
#import "BBScrollView.h"

@interface ViewController () <UITableViewDelegate>

@end

@implementation ViewController {
    UIScrollView * _table;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self demoWithScrollView];
    [self demoWithTableView];
}

- (void)demoWithScrollView{
    // Do any additional setup after loading the view, typically from a nib.
    BBScrollView *table = [[BBScrollView alloc] initWithFrame:self.view.bounds];
    UIView *cell;
    cell = [[UIView alloc] initWithTable:table height:100];
    cell.backgroundColor = [UIColor redColor];
    UITapGestureRecognizer *g;
    g = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickView:)];
    cell.userInteractionEnabled = YES;
    [cell addGestureRecognizer:g];
    
    cell = [[UIView alloc] initWithTable:table height:200];
    cell.backgroundColor = [UIColor greenColor];
    g = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickView:)];
    cell.userInteractionEnabled = YES;
    [cell addGestureRecognizer:g];
    
    cell = [[UIView alloc] initWithTable:table height:400];
    cell.backgroundColor = [UIColor blueColor];
    g = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickView:)];
    cell.userInteractionEnabled = YES;
    [cell addGestureRecognizer:g];
    
    [self.view addSubview:table];
    
    [(BBScrollView *)table reloadData];
    
    _table = table;
}

- (void)demoWithTableView{
    // Do any additional setup after loading the view, typically from a nib.
    BBTableView *table = [[BBTableView alloc] initWithFrame:self.view.bounds];
    UITableViewCell *cell;
    cell = [[UITableViewCell alloc] initWithTable:table];
    cell.backgroundColor = [UIColor redColor];
    [cell setCellHeight:100];
    UITapGestureRecognizer *g;
    g = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickView:)];
    cell.userInteractionEnabled = YES;
    [cell addGestureRecognizer:g];
    
    cell = [[UITableViewCell alloc] initWithTable:table];
    cell.backgroundColor = [UIColor greenColor];
    [cell setCellHeight:200];
    g = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickView:)];
    cell.userInteractionEnabled = YES;
    [cell addGestureRecognizer:g];
    
    cell = [[UITableViewCell alloc] initWithTable:table];
    cell.backgroundColor = [UIColor blueColor];
    [cell setCellHeight:400];
    g = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickView:)];
    cell.userInteractionEnabled = YES;
    [cell addGestureRecognizer:g];
    
    [self.view addSubview:table];
    
    [table reloadData];
    
    _table = table;

}

- (void)clickView:(UITapGestureRecognizer *)sender {
    UIView *cell = (UIView *)sender.view;
    if ([cell isKindOfClass:[UITableViewCell class]]) {
        [((UITableViewCell *)cell) setCellHeight:(500-cell.frame.size.height)];
    }else{
        cell.frame = CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, 500-cell.frame.size.height);
    }
    if ([_table isKindOfClass:[BBScrollView class]]) {
        [((BBScrollView *)_table) updateCell:cell];
    }
    if ([_table isKindOfClass:[BBTableView class]]) {
        [((BBTableView *)_table) reloadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
