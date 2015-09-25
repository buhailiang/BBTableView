//
//  BBTableView.m
//  
//
//  Created by bartx on 15/9/25.
//
//

#import "BBTableView.h"
#import <objc/runtime.h>

@interface BBTableView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) id<UITableViewDataSource> outDataSource;
@property (nonatomic, retain) id<UITableViewDelegate> outDelegate;

@end


@implementation BBTableView {
    NSMutableArray<UITableViewCell *> *cells;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        cells = [[NSMutableArray alloc] init];
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

//- (void)updateCell:(UITableViewCell *)cell {
//    [self beginUpdates];
//    NSIndexPath *path = [NSIndexPath indexPathForRow:[cells indexOfObject:cell] inSection:0];
//    [self reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationAutomatic];
//    [self endUpdates];
//    //[self reloadData];
//}

#pragma mark - view arry handlers
- (void)addView:(UITableViewCell *)view {
    [self addView:view atIndex:cells.count];
}

- (void)addView:(UITableViewCell *)view atIndex:(NSUInteger)idx {
    if (idx > cells.count) {
        idx = cells.count;
    }
    [cells insertObject:view atIndex:idx];
}

- (void)removeView:(UITableViewCell *)view {
    [cells removeObject:view];
}

#pragma mark - delegate & datasource overrider
- (void)setDataSource:(id<UITableViewDataSource>)dataSource {
    if (self.dataSource) {
        _outDataSource = dataSource;
    } else {
        [super setDataSource:dataSource];
    }
}

- (void)setDelegate:(id<UITableViewDelegate>)delegate {
    if (self.delegate) {
        _outDelegate = delegate;
    } else {
        [super setDelegate:delegate];
    }
    
}

#pragma mark - tableview delegate & datasource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return cells[indexPath.row];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return cells.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = cells[indexPath.row];
    return cell.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_outDelegate) {
        [_outDelegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

@end

@implementation UITableViewCell (BBTableView)

- (instancetype)initWithTable:(BBTableView *)table{
    self = [self initWithFrame:CGRectMake(0, 0, table.frame.size.width, 0)];
    [self setTableView:table];
    [table addView:self];
    return self;
}

- (BBTableView *)tableView {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setTableView:(BBTableView *)t {
    return objc_setAssociatedObject(self, @selector(tableView), t, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)cellHeight {
    return self.frame.size.height;
}

- (void)setCellHeight:(CGFloat)cellHeight {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y,
                            self.frame.size.width, cellHeight);
}

@end



