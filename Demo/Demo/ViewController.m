//
//  ViewController.m
//  Demo
//
//  Created by bartx on 15/9/25.
//  Copyright © 2015年 bartx. All rights reserved.
//

#import "ViewController.h"
#import "BBTableView.h"

@interface ViewController () <UITableViewDelegate>

@end

@implementation ViewController {
    BBTableView * table;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    table = [[BBTableView alloc] initWithFrame:self.view.bounds];
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
    
    //table.delegate = self;

}

- (void)clickView:(UITapGestureRecognizer *)sender {
    UITableViewCell *cell = (UITableViewCell *)sender.view;
    [cell setCellHeight:(500-cell.cellHeight)];
    [table reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
