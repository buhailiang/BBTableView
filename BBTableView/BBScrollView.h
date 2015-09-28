//
//  BBScrollView.h
//  
//
//  Created by bartx on 15/9/28.
//
//

#import <UIKit/UIKit.h>

@interface BBScrollView : UIScrollView

- (void)updateCell:(UIView *)cell;
- (void)reloadData; //to compatible with tableview

- (void)addView:(UIView *)view;
- (void)addView:(UIView *)view atIndex:(NSUInteger)idx;
- (void)removeView:(UIView *)view;


@end

@interface UIView(BBTableView);

- (instancetype)initWithTable:(BBScrollView *)table;
- (instancetype)initWithTable:(BBScrollView *)table height:(CGFloat)height;

- (CGFloat)cellHeight;
- (void)setCellHeight:(CGFloat)cellHeight;

@end