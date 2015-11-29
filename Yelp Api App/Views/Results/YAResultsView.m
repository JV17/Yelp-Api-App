//
//  YAResultsView.m
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-29.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import "YAResultsView.h"
#import "YAResultsData.h"


@interface YAResultsView() <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end


// cell
static CGFloat const kCellFontSize = 14;
static NSString *const kCellTextColor = @"2B2B2B";
static CGFloat const kCellHeight = 80;
static NSString *const kCellBackgroundColor = @"F7F7F7";
static CGFloat const kCellHeaderHeight = 12;
static CGFloat const kDuration = 0.3;


@implementation YAResultsView

#pragma mark - Initializers

- (instancetype)init
{
    return [self initWithFrame:CGRectZero resultsData:@[]];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame resultsData:@[]];
}


- (instancetype)initWithFrame:(CGRect)frame resultsData:(NSArray<YAResultsData *> *)results
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        _data = results;
        [self setupResultsView];
    }
    
    return self;
}


- (void)setupResultsView
{
    [self addSubview:self.tableView];
}


#pragma mark - Custom Accessors

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0"))
        {
            _tableView.layoutMargins = UIEdgeInsetsZero;
        }
        
        _tableView.bounces = YES;
        _tableView.scrollEnabled = YES;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    
    return _tableView;
}


- (void)setData:(NSArray<YAResultsData *> *)data
{
    _data = data;
    
    if (data.count)
    {
        [self.tableView reloadData];
    }
}


#pragma mark - UITableViewDelegate & UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        self.tableView.layoutMargins = UIEdgeInsetsZero;
    }
    
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)])
    {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [[UIColor colorWithHexString:kCellBackgroundColor] colorWithAlphaComponent:0.9];
    
    cell.textLabel.font = [UIFont fontWithName:YALatoRegular size:kCellFontSize];
    cell.textLabel.textColor = [UIColor colorWithHexString:kCellTextColor];
    
    cell.detailTextLabel.font = [UIFont fontWithName:YALatoLightFont size:kCellFontSize];
    cell.detailTextLabel.textColor = [UIColor colorWithHexString:kCellTextColor];
    
    cell.layer.cornerRadius = 5;
    cell.layer.masksToBounds = YES;
    
    if (indexPath.section < self.data.count)
    {
        YAResultsData *cellData = (YAResultsData *)[self.data objectAtIndex:indexPath.section];
        cell.imageView.image = cellData.imagePreview;
        cell.textLabel.text = cellData.name;
        cell.detailTextLabel.text = cellData.shortDescription;
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeight;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kCellHeaderHeight;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIView new];
}


#pragma mark - Hide & Show

- (void)showResultsViewAnimated
{
    [UIView animateWithDuration:kDuration animations:^{
        self.alpha = 1.0;
    }];
}


- (void)hideResultsViewAnimated
{
    [UIView animateWithDuration:kDuration animations:^{
        self.alpha = 0.0;
    }];
}

@end
