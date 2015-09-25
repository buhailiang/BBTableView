//
//  BBTableView.h
//  
//
//  Created by bartx on 15/9/25.
//
//

#import <UIKit/UIKit.h>


@interface BBTableView : UITableView

- (void)addView:(UITableViewCell *)view;
- (void)addView:(UITableViewCell *)view atIndex:(NSUInteger)idx;
- (void)removeView:(UITableViewCell *)view;

//- (void)updateCell:(UITableViewCell *)cell;


@end


@interface UITableViewCell(BBTableView);

- (instancetype)initWithTable:(BBTableView *)table;
- (CGFloat)cellHeight;
- (void)setCellHeight:(CGFloat)cellHeight;

@end
