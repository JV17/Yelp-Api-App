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

@property (nonatomic, strong) UIButton *backButton;

@end

// view
static CGFloat const kTopPadding = 20;
static CGFloat const kDefaultPadding = 10;
static NSString *const kTextColor = @"2B2B2B";

// image view
static CGFloat const kMaxImageWidth = 160;
static NSString *const kImageBorderColor = @"2B2B2B";

// name label
static CGFloat const kNameLabelHeight = 30;
static CGFloat const kNameLabelFontSize = 20;
static CGFloat const kLabelFontSize = 16;
static CGFloat const kLabelHeight = 20;

// back button
static CGFloat const kBackButtonLeftPadding = 10;
static CGFloat const kBackButtonTopPadding = 20;
static CGFloat const kBackButtonSize = 50;


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
        [self setupDetailsView];
    }
    
    return self;
}


- (void)setupDetailsView
{
    if (!self.nameLabel.window)
    {
        [self addSubview:self.nameLabel];
    }
    
#warning fix issue with business categories saving as NSArray.
//    if (!self.categoryLabel.window)
//    {
//        [self addSubview:self.categoryLabel];
//    }
    
    if (!self.imageView.window)
    {
        [self addSubview:self.imageView];
    }
    
    if (!self.addressLabel.window)
    {
        [self addSubview:self.addressLabel];
    }
    
    if (!self.phoneNumberLabel.window)
    {
        [self addSubview:self.phoneNumberLabel];
    }

    if (!self.shortDescriptionLabel.window)
    {
        [self addSubview:self.shortDescriptionLabel];
    }
    
    if (!self.backButton.window)
    {
        [self addSubview:self.backButton];
    }
}


#pragma mark - Custom Accessors

//TODO: add business category update
- (void)setData:(YAResultsData *)data
{
    _data = data;
    
    if (self.data)
    {
        self.nameLabel.text = self.data.name;
        
        self.imageView.frame = self.imageViewFrame;
        self.imageView.image = self.mainImage;
        
        self.shortDescriptionLabel.text = self.data.shortDescription;
        self.shortDescriptionLabel.frame = self.shortDescriptionLabelFrame;

        self.phoneNumberLabel.text = self.data.phoneNumber;
        self.phoneNumberLabel.frame = self.phoneNumberLabelFrame;

        self.addressLabel.text = self.data.address;
        self.addressLabel.frame = self.addressLabelFrame;
        
        [self setupDetailsView];
    }
}


- (UIButton *)backButton
{
    if (!_backButton)
    {
        _backButton = [[UIButton alloc] initWithFrame:self.backButtonFrame];
        _backButton.backgroundColor = [UIColor blackColor];
        [_backButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _backButton;
}


- (CGRect)backButtonFrame
{
    return CGRectMake(kBackButtonLeftPadding, kBackButtonTopPadding, kBackButtonSize, kBackButtonSize);
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
    return CGRectMake(CGRectGetMaxX(self.backButton.frame), kTopPadding, self.frame.size.width - ((self.backButton.frame.size.width + kBackButtonLeftPadding) * 2), kNameLabelHeight);
}


- (UILabel *)categoryLabel
{
    if (!_categoryLabel)
    {
        _categoryLabel = [self labelWithFrame:self.categoryLabelFrame font:[UIFont fontWithName:YALatoLightFont size:kLabelFontSize] shadow:NO];
        _categoryLabel.text = self.data.businessCategory;
    }
    
    return _categoryLabel;
}


- (CGRect)categoryLabelFrame
{
    return CGRectMake(CGRectGetMaxX(self.backButton.frame), CGRectGetMaxY(self.nameLabel.frame), self.frame.size.width - ((self.backButton.frame.size.width + kBackButtonLeftPadding) * 2), kNameLabelHeight);
}


- (UILabel *)addressLabel
{
    if (!_addressLabel)
    {
        _addressLabel = [self labelWithFrame:self.addressLabelFrame font:[UIFont fontWithName:YALatoLightFont size:kLabelFontSize] shadow:NO];
        _addressLabel.text = self.data.address;
    }
    
    return _addressLabel;
}


- (CGRect)addressLabelFrame
{
    return CGRectMake(CGRectGetMaxX(self.backButton.frame), CGRectGetMaxY(self.imageView.frame) + kTopPadding, self.frame.size.width - ((self.backButton.frame.size.width + kBackButtonLeftPadding) * 2), kLabelHeight);
}


- (UILabel *)phoneNumberLabel
{
    if (!_phoneNumberLabel)
    {
        _phoneNumberLabel = [self labelWithFrame:self.phoneNumberLabelFrame font:[UIFont fontWithName:YALatoLightFont size:kLabelFontSize] shadow:NO];
        _phoneNumberLabel.text = self.data.phoneNumber;
    }
    
    return _phoneNumberLabel;
}


- (CGRect)phoneNumberLabelFrame
{
    return CGRectMake(CGRectGetMaxX(self.backButton.frame), CGRectGetMaxY(self.addressLabel.frame) + kTopPadding, self.frame.size.width - ((self.backButton.frame.size.width + kBackButtonLeftPadding) * 2), kLabelHeight);
}


- (UILabel *)shortDescriptionLabel
{
    if (!_shortDescriptionLabel)
    {
        _shortDescriptionLabel = [self labelWithFrame:CGRectZero font:[UIFont fontWithName:YALatoLightFont size:kLabelFontSize] shadow:NO];
        _shortDescriptionLabel.numberOfLines = 0;
        _shortDescriptionLabel.text = self.data.shortDescription;
        _shortDescriptionLabel.frame = self.shortDescriptionLabelFrame;
    }
    
    return _shortDescriptionLabel;
}


- (CGRect)shortDescriptionLabelFrame
{
    [_shortDescriptionLabel sizeToFit];
    return CGRectMake(CGRectGetMaxX(self.backButton.frame), CGRectGetMaxY(self.phoneNumberLabel.frame) + kTopPadding, self.frame.size.width - ((self.backButton.frame.size.width + kBackButtonLeftPadding) * 2), self.shortDescriptionLabel.frame.size.height);
}


- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc] initWithFrame:self.imageViewFrame];
        _imageView.image = self.mainImage;
        _imageView.clipsToBounds = YES;
        _imageView.layer.cornerRadius = kMaxImageWidth / 2;
        _imageView.layer.borderWidth = 1;
        _imageView.layer.borderColor = [UIColor colorWithHexString:kImageBorderColor].CGColor;
    }
    
    return _imageView;
}


- (UIImage *)mainImage
{
    return [UIImage imageWithSourceImage:self.data.imagePreview scaledToWidth:kMaxImageWidth];
}


- (CGRect)imageViewFrame
{
    return CGRectMake(((self.frame.size.width / 2) - (kMaxImageWidth / 2)), CGRectGetMaxY(self.nameLabel.frame) + kDefaultPadding, kMaxImageWidth, kMaxImageWidth);
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


- (void)backButtonPressed
{
    if ([self.delegate respondsToSelector:@selector(backButtonPressed)])
    {
        [self.delegate backButtonPressed];
    }
}

@end
