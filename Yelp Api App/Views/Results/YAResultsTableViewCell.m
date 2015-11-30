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

@property (nonatomic, strong) UIView *boderView;

@property (nonatomic, strong) UIImageView *previewImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *descriptionLabel;

@property (nonatomic, strong) UIImageView *ratingImageView;

@end


// border view
static CGFloat const kBoderWidth = 10;
static NSString *const kBorderColor = @"FF1300";

// preview image
static CGFloat const kPreviewImageWidth = 60;

// title label
static CGFloat const kLeftPadding = 10;
static CGFloat const kLabelHeight = 16;
static CGFloat const kLabelFontSize = 13;
static NSString *const kLabelTextColor = @"2B2B2B";

// rating image
static CGFloat const kRatingImageWidth = 68;
static CGFloat const kRatingImageHeight = 14;


@implementation YAResultsTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - Custom Accessors

- (void)setData:(YAResultsData *)data
{
    _data = data;
    
    if (data)
    {
        [self addSubview:self.boderView];
        
        self.previewImageView.image = self.data.imagePreview;
        [self addSubview:self.previewImageView];
        
        self.titleLabel.text = self.data.name;
        [self addSubview:self.titleLabel];
        
        self.descriptionLabel.text = self.data.shortDescription;
        [self addSubview:self.descriptionLabel];
        
        self.ratingImageView.image = self.data.ratingImage;
        [self addSubview:self.ratingImageView];
    }
}


- (UIView *)boderView
{
    if (!_boderView)
    {
        _boderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kBoderWidth, self.frame.size.height)];
        _boderView.backgroundColor = [UIColor colorWithHexString:kBorderColor];
    }
    
    return _boderView;
}


- (UIImageView *)previewImageView
{
    if (!_previewImageView)
    {
        _previewImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.boderView.frame), 0, kPreviewImageWidth, self.frame.size.height)];
    }
    
    return _previewImageView;
}


- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.previewImageView.frame) + kLeftPadding, 2, (self.frame.size.width - self.previewImageView.frame.size.width - self.boderView.frame.size.width - kLeftPadding), kLabelHeight)];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont fontWithName:YALatoRegular size:kLabelFontSize];
        _titleLabel.textColor = [UIColor colorWithHexString:kLabelTextColor];
    }
    
    return _titleLabel;
}


- (UILabel *)descriptionLabel
{
    if (!_descriptionLabel)
    {
        _descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.previewImageView.frame) + kLeftPadding, CGRectGetMaxY(self.titleLabel.frame), self.titleLabel.frame.size.width, (kLabelHeight * 2))];
        _descriptionLabel.backgroundColor = [UIColor clearColor];
        _descriptionLabel.font = [UIFont fontWithName:YALatoLightFont size:kLabelFontSize];
        _descriptionLabel.textColor = [UIColor colorWithHexString:kLabelTextColor];
        _descriptionLabel.numberOfLines = 0;
        _descriptionLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    
    return _descriptionLabel;
}


- (UIImageView *)ratingImageView
{
    if (!_ratingImageView)
    {
        _ratingImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.previewImageView.frame) + kLeftPadding, CGRectGetMaxY(self.descriptionLabel.frame) + 4, kRatingImageWidth, kRatingImageHeight)];
    }
    
    return _ratingImageView;
}

@end
