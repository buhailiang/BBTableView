//
//  BBScrollView.m
//  
//
//  Created by bartx on 15/9/28.
//
//

#import "BBScrollView.h"
#import <objc/runtime.h>

@implementation BBScrollView

- (void)updateCell:(UIView *)cell {
    NSUInteger index = [self.subviews indexOfObject:cell];
    [self reloadData:index];
}

- (void)reloadData {
    [self reloadData:0];
}

- (void)reloadData:(NSUInteger)index {
    NSArray<UIView *> *cells = self.subviews;
    CGFloat top = 0;
    for (NSUInteger i = index; i < cells.count; i++) {
        CGRect f = cells[i].frame;
        if (top > 0) {
            f.origin.y = top;
            cells[i].frame = f;
        }
        top = f.size.height+f.origin.y;
    }
}

@end

@implementation UIView (BBTableView)

- (instancetype)initWithTable:(BBScrollView *)table{
    return [self initWithTable:table height:0];
}

- (instancetype)initWithTable:(BBScrollView *)table height:(CGFloat)height{
    self = [self initWithFrame:CGRectMake(0, 0, table.frame.size.width, height)];
    if (self) {
        [self setTableView:table];
        [table addSubview:self];
    }
    return self;
}

- (BBScrollView *)tableView {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setTableView:(BBScrollView *)t {
    return objc_setAssociatedObject(self, @selector(tableView), t, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)cellHeight {
    return self.frame.size.height;
}

- (void)setCellHeight:(CGFloat)cellHeight {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y,
                            self.frame.size.width, cellHeight);
    [[self tableView] updateCell:self];
}

@end
