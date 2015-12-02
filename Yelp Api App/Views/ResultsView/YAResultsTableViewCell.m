//
//  YAResultsTableViewCell.m
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-29.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import "YAResultsTableViewCell.h"
#import "YAResultsData.h"


@interface YAResultsTableViewCell()

@property (nonatomic, strong) UIView *borderView;

@property (nonatomic, strong) UIImageView *previewImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *reviewLabel;

@property (nonatomic, strong) UIImageView *ratingImageView;

@property (nonatomic, strong) UIImageView *indicatorImageView;

@end


// border view
static CGFloat const kBorderWidth = 7;
static NSString *const kBorderColor = @"FF1300";

// preview image view
static CGFloat const kPreviewImageWidth = 70;

// title label
static CGFloat const kLeftPadding = 10;
static CGFloat const kLabelHeight = 16;
static CGFloat const kLabelFontSize = 13;
static NSString *const kLabelTextColor = @"2B2B2B";

// rating image view
static CGFloat const kRatingImageWidth = 68;
static CGFloat const kRatingImageHeight = 14;

// indicator image view
static CGFloat const kIndicatorSize = 20;
static NSString *const kIndicatorImageName = @"forward";

// cell highlighted colors
static NSString *const kCellNotHighlightedColor = @"F7F7F7";
static NSString *const kCellHighlightedColor = @"1AD6FD";


@implementation YAResultsTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.borderView.frame = self.borderViewFrame;
    self.previewImageView.frame = self.previewImageViewFrame;
    self.titleLabel.frame = self.titleLabelFrame;
    self.reviewLabel.frame = self.reviewLabelFrame;
    self.ratingImageView.frame = self.ratingImageViewFrame;
    self.indicatorImageView.frame = self.indicatorImageViewFrame;
}


#pragma mark - Custom Accessors

- (void)setData:(YAResultsData *)data
{
    _data = data;
    
    if (data)
    {
        [self addSubview:self.borderView];
        
        self.previewImageView.image = [UIImage imageNamed:YANoImageName];
        [self addSubview:self.previewImageView];
        
        self.titleLabel.text = self.data.name;
        [self addSubview:self.titleLabel];
        
        self.reviewLabel.text = self.data.review;
        [self addSubview:self.reviewLabel];
        
        self.ratingImageView.image = [UIImage imageNamed:YANoImageName];
        [self addSubview:self.ratingImageView];
        
        [self addSubview:self.indicatorImageView];
        
        [self loadImagesInBackgroundThread];
    }
}


- (void)loadImagesInBackgroundThread
{
    [UIImage imageWithURL:self.data.imagePreviewURL completion:^(UIImage *image, NSError *error) {
        if (image)
        {
            self.previewImageView.image = image;
        }
    }];

    [UIImage imageWithURL:self.data.ratingImageURL completion:^(UIImage *image, NSError *error) {
        if (image)
        {
            self.ratingImageView.image = image;
        }
    }];
}


- (UIView *)borderView
{
    if (!_borderView)
    {
        _borderView = [[UIView alloc] initWithFrame:self.borderViewFrame];
        _borderView.backgroundColor = [UIColor colorWithHexString:kBorderColor];
    }
    
    return _borderView;
}


- (CGRect)borderViewFrame
{
    return CGRectMake(0, 0, kBorderWidth, self.frame.size.height);
}


- (UIImageView *)previewImageView
{
    if (!_previewImageView)
    {
        _previewImageView = [[UIImageView alloc] initWithFrame:self.previewImageViewFrame];
    }
    
    return _previewImageView;
}


- (CGRect)previewImageViewFrame
{
    return CGRectMake(CGRectGetMaxX(self.borderView.frame), 0, kPreviewImageWidth, self.frame.size.height);
}


- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc] initWithFrame:self.titleLabelFrame];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont fontWithName:YALatoRegular size:kLabelFontSize];
        _titleLabel.textColor = [UIColor colorWithHexString:kLabelTextColor];
    }
    
    return _titleLabel;
}


- (CGRect)titleLabelFrame
{
    return CGRectMake(CGRectGetMaxX(self.previewImageView.frame) + kLeftPadding, 2, (self.frame.size.width - self.previewImageView.frame.size.width - self.borderView.frame.size.width - kLeftPadding - kIndicatorSize - 2), kLabelHeight);
}


- (UILabel *)reviewLabel
{
    if (!_reviewLabel)
    {
        _reviewLabel = [[UILabel alloc] initWithFrame:self.reviewLabelFrame];
        _reviewLabel.backgroundColor = [UIColor clearColor];
        _reviewLabel.font = [UIFont fontWithName:YALatoLightFont size:kLabelFontSize];
        _reviewLabel.textColor = [UIColor colorWithHexString:kLabelTextColor];
        _reviewLabel.numberOfLines = 0;
        _reviewLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    
    return _reviewLabel;
}


- (CGRect)reviewLabelFrame
{
    return CGRectMake(CGRectGetMaxX(self.previewImageView.frame) + kLeftPadding, CGRectGetMaxY(self.titleLabel.frame), self.titleLabel.frame.size.width, (kLabelHeight * 2));
}


- (UIImageView *)ratingImageView
{
    if (!_ratingImageView)
    {
        _ratingImageView = [[UIImageView alloc] initWithFrame:self.ratingImageViewFrame];
    }
    
    return _ratingImageView;
}


- (CGRect)ratingImageViewFrame
{
    return CGRectMake(CGRectGetMaxX(self.previewImageView.frame) + kLeftPadding, CGRectGetMaxY(self.reviewLabel.frame) + 4, kRatingImageWidth, kRatingImageHeight);
}


- (UIImageView *)indicatorImageView
{
    if (!_indicatorImageView)
    {
        _indicatorImageView = [[UIImageView alloc] initWithFrame:self.indicatorImageViewFrame];
        _indicatorImageView.image = [UIImage imageNamed:kIndicatorImageName];
    }
    
    return _indicatorImageView;
}


- (CGRect)indicatorImageViewFrame
{
    return CGRectMake((CGRectGetMaxX(self.frame) - (kIndicatorSize + 2)), ((self.frame.size.height / 2) - (kIndicatorSize / 2)), kIndicatorSize, kIndicatorSize);
}

@end
