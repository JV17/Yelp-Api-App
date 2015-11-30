//
//  YADetailsView.m
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-29.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import "YADetailsView.h"
#import "YAResultsData.h"


@interface YADetailsView()

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *categoryLabel;

@property (nonatomic, strong) UILabel *phoneNumberLabel;

@property (nonatomic, strong) UILabel *addressLabel;

@property (nonatomic, strong) UILabel *shortDescriptionLabel;

@end

// view
static CGFloat const kTopPadding = 20;
static CGFloat const kDefaultPadding = 10;
static NSString *const kTextColor = @"2B2B2B";

// image view
static CGFloat const kMaxImageWidth = 120;

// name label
static CGFloat const kNameLabelHeight = 30;
static CGFloat const kNameLabelFontSize = 20;


@implementation YADetailsView

#pragma mark - Initializers

- (instancetype)init
{
    return [self initWithFrame:CGRectZero data:nil];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame data:nil];
}


- (instancetype)initWithFrame:(CGRect)frame data:(YAResultsData *)data
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        _data = data;
    }
    
    return self;
}


- (void)setupDetailsView
{
    [self addSubview:self.nameLabel];
    [self addSubview:self.imageView];
}


#pragma mark - Custom Accessors

- (void)setData:(YAResultsData *)data
{
    _data = data;
    
    if (self.data)
    {
        self.nameLabel.text = self.data.name;
        
        self.imageView.frame = self.imageViewFrame;
        self.imageView.image = self.mainImage;
    }
}


- (UILabel *)nameLabel
{
    if (!_nameLabel)
    {
        _nameLabel = [self labelWithFrame:self.nameLabelFrame font:[UIFont fontWithName:YALatoRegular size:kNameLabelFontSize] shadow:YES];
        _nameLabel.text = self.data.name;
    }
                      
    return _nameLabel;
}


- (CGRect)nameLabelFrame
{
    return CGRectMake(0, kTopPadding, self.frame.size.width, kNameLabelHeight);
}


- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc] initWithFrame:self.imageViewFrame];
        _imageView.image = self.mainImage;
    }
    
    return _imageView;
}


- (UIImage *)mainImage
{
    return [UIImage imageWithSourceImage:self.data.imagePreview scaledToWidth:kMaxImageWidth];
}


- (CGRect)imageViewFrame
{
    return CGRectMake(((self.frame.size.width / 2) - (self.data.imagePreview.size.width / 2)), CGRectGetMaxY(self.nameLabel.frame) + kDefaultPadding, kMaxImageWidth, self.data.imagePreview.size.height);
}


#pragma mark - View Helper Functions

- (UILabel *)labelWithFrame:(CGRect)frame font:(UIFont *)font shadow:(BOOL)shadow
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.font = font;
    label.textColor = [UIColor colorWithHexString:kTextColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    if (shadow)
    {
        label.layer.shadowOffset = CGSizeMake(2, 2);
        label.layer.shadowRadius = 2;
        label.layer.shadowColor = [UIColor colorWithHexString:kTextColor].CGColor;
        label.layer.shadowOpacity = 0.6;
    }

    return label;
}

@end