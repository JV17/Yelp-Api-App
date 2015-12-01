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

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *categoryLabel;

@property (nonatomic, strong) UILabel *phoneNumberLabel;

@property (nonatomic, strong) UILabel *addressLabel;

@property (nonatomic, strong) UILabel *reviewLabel;

@property (nonatomic, strong) UIButton *backButton;

@property (nonatomic, strong) UILabel *addressTitleLabel;

@property (nonatomic, strong) UILabel *reviewTitleLabel;

@end

// view
static CGFloat const kTopPadding = 28;
static CGFloat const kDefaultPadding = 10;
static NSString *const kTextColor = @"2B2B2B";

// image view
static CGFloat const kMaxImageWidth = 160;
static NSString *const kImageBorderColor = @"2B2B2B";

// name label
static CGFloat const kNameLabelHeight = 26;
static CGFloat const kNameLabelFontSize = 20;
static CGFloat const kLabelFontSize = 18;
static CGFloat const kLabelHeight = 20;

// back button
static CGFloat const kBackButtonTopPadding = 20;
static CGFloat const kBackButtonSize = 50;
static NSString *const kBackButtonImageName = @"back";

// labels
static CGFloat const kLabelLeftPadding = 20;


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
    if (IS_IPHONE_4_OR_LESS)
    {
        [self loadScrollView];
    }
    else
    {
        [self loadView];
    }
    
    if (!self.backButton.window)
    {
        [self addSubview:self.backButton];
    }
}


#pragma mark - Custom Accessors

#warning add business category update
- (void)setData:(YAResultsData *)data
{
    _data = data;
    
    if (self.data)
    {
        [self updateViewContentAndFrames];
    }
}


- (UIScrollView *)scrollView
{
    if (!_scrollView)
    {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.scrollEnabled = YES;
    }
    
    return _scrollView;
}


- (CGFloat)scrollViewContentHeight
{
    return self.nameLabel.frame.size.height + self.categoryLabel.frame.size.height + self.imageView.frame.size.height + self.addressTitleLabel.frame.size.height + self.addressLabel.frame.size.height + self.phoneNumberLabel.frame.size.height + self.reviewLabel.frame.size.height + self.reviewTitleLabel.frame.size.height + (kTopPadding * 3) + (kDefaultPadding * 1.5) + 4;
}


- (UIButton *)backButton
{
    if (!_backButton)
    {
        _backButton = [[UIButton alloc] initWithFrame:self.backButtonFrame];
        _backButton.backgroundColor = [UIColor clearColor];
        [_backButton setImage:[UIImage imageNamed:kBackButtonImageName] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _backButton;
}


- (CGRect)backButtonFrame
{
    return CGRectMake(0, kBackButtonTopPadding, kBackButtonSize, kBackButtonSize);
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
    return CGRectMake(CGRectGetMaxX(self.backButton.frame), kTopPadding, self.frame.size.width - ((self.backButton.frame.size.width) * 2), kNameLabelHeight);
}


- (UILabel *)categoryLabel
{
    if (!_categoryLabel)
    {
        _categoryLabel = [self labelWithFrame:self.categoryLabelFrame font:[UIFont fontWithName:YALatoRegular size:kLabelFontSize] shadow:NO];
        _categoryLabel.text = self.data.businessCategory;
    }
    
    return _categoryLabel;
}


- (CGRect)categoryLabelFrame
{
    return CGRectMake(CGRectGetMaxX(self.backButton.frame), CGRectGetMaxY(self.nameLabel.frame), self.frame.size.width - ((self.backButton.frame.size.width) * 2), kNameLabelHeight);
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
    return CGRectMake(((self.frame.size.width / 2) - (kMaxImageWidth / 2)), (CGRectGetMaxY(self.categoryLabel.frame) + (kDefaultPadding * 1.5)), kMaxImageWidth, kMaxImageWidth);
}


- (UILabel *)addressTitleLabel
{
    if (!_addressTitleLabel)
    {
        _addressTitleLabel = [self labelWithFrame:self.addressTitleLabelFrame font:[UIFont fontWithName:YALatoRegular size:kNameLabelFontSize] shadow:YES];
        _addressTitleLabel.text = @"Contact Information";
    }
    
    return _addressTitleLabel;
}


- (CGRect)addressTitleLabelFrame
{
    return CGRectMake(CGRectGetMaxX(self.backButton.frame), CGRectGetMaxY(self.imageView.frame) + kTopPadding, self.frame.size.width - ((self.backButton.frame.size.width) * 2), kNameLabelHeight);
}


- (UILabel *)addressLabel
{
    if (!_addressLabel)
    {
        _addressLabel = [self labelWithFrame:self.addressLabelFrame font:[UIFont fontWithName:YALatoRegular size:kLabelFontSize] shadow:NO];
        _addressLabel.text = self.data.address;
    }
    
    return _addressLabel;
}


- (CGRect)addressLabelFrame
{
    return CGRectMake(kLabelLeftPadding, CGRectGetMaxY(self.addressTitleLabel.frame) + 2, self.frame.size.width - (kLabelLeftPadding * 2), kLabelHeight);
}


- (UILabel *)phoneNumberLabel
{
    if (!_phoneNumberLabel)
    {
        _phoneNumberLabel = [self labelWithFrame:self.phoneNumberLabelFrame font:[UIFont fontWithName:YALatoRegular size:kLabelFontSize] shadow:NO];
        _phoneNumberLabel.text = self.data.phoneNumber;
    }
    
    return _phoneNumberLabel;
}


- (CGRect)phoneNumberLabelFrame
{
    return CGRectMake(kLabelLeftPadding, CGRectGetMaxY(self.addressLabel.frame) + 2, self.frame.size.width - (kLabelLeftPadding * 2), kLabelHeight);
}


- (UILabel *)reviewTitleLabel
{
    if (!_reviewTitleLabel)
    {
        _reviewTitleLabel = [self labelWithFrame:self.reviewTitleLabelFrame font:[UIFont fontWithName:YALatoRegular size:kNameLabelFontSize] shadow:YES];
        _reviewTitleLabel.text = @"Latest Review";
    }
    
    return _reviewTitleLabel;
}


- (CGRect)reviewTitleLabelFrame
{
    return CGRectMake(kLabelLeftPadding, CGRectGetMaxY(self.phoneNumberLabel.frame) + kTopPadding, self.frame.size.width - (kLabelLeftPadding * 2), kNameLabelHeight);
}


- (UILabel *)reviewLabel
{
    if (!_reviewLabel)
    {
        _reviewLabel = [self labelWithFrame:self.reviewLabelFrame font:[UIFont fontWithName:YALatoRegular size:kLabelFontSize] shadow:NO];
        _reviewLabel.text = self.data.review;
        _reviewLabel.numberOfLines = 0;
        _reviewLabel.adjustsFontSizeToFitWidth = NO;
        [_reviewLabel sizeToFit];
    }
    
    return _reviewLabel;
}


- (CGRect)reviewLabelFrame
{
    return CGRectMake(kLabelLeftPadding, CGRectGetMaxY(self.reviewTitleLabel.frame), self.frame.size.width - (kLabelLeftPadding * 2), kNameLabelHeight);
}


#pragma mark - View Helper Functions

- (UILabel *)labelWithFrame:(CGRect)frame font:(UIFont *)font shadow:(BOOL)shadow
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.font = font;
    label.textColor = [UIColor colorWithHexString:kTextColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    
    if (shadow)
    {
        label.layer.shadowOffset = CGSizeMake(2, 2);
        label.layer.shadowRadius = 2;
        label.layer.shadowColor = [UIColor colorWithHexString:kTextColor].CGColor;
        label.layer.shadowOpacity = 0.6;
    }

    return label;
}


- (void)loadScrollView
{
    if (!self.scrollView.window)
    {
        [self addSubview:self.scrollView];
        [self.scrollView addSubview:self.nameLabel];
        [self.scrollView addSubview:self.categoryLabel];
        [self.scrollView addSubview:self.imageView];
        [self.scrollView addSubview:self.addressTitleLabel];
        [self.scrollView addSubview:self.addressLabel];
        [self.scrollView addSubview:self.phoneNumberLabel];
        [self.scrollView addSubview:self.reviewTitleLabel];
        [self.scrollView addSubview:self.reviewLabel];
        
        self.scrollView.contentSize = CGSizeMake(self.frame.size.width, self.scrollViewContentHeight);
    }
}


- (void)loadView
{
    if (!self.nameLabel.window)
    {
        [self addSubview:self.nameLabel];
    }
    
    if (!self.categoryLabel.window)
    {
        [self addSubview:self.categoryLabel];
    }
    
    if (!self.imageView.window)
    {
        [self addSubview:self.imageView];
    }
    
    if (!self.addressLabel.window)
    {
        [self addSubview:self.addressTitleLabel];
        [self addSubview:self.addressLabel];
    }
    
    if (!self.phoneNumberLabel.window)
    {
        [self addSubview:self.phoneNumberLabel];
    }
    
    if (!self.reviewLabel.window)
    {
        [self addSubview:self.reviewTitleLabel];
        [self addSubview:self.reviewLabel];
    }
}


- (void)updateViewContentAndFrames
{
    self.nameLabel.text = self.data.name;
    self.categoryLabel.text = self.data.businessCategory;

    self.imageView.frame = self.imageViewFrame;
    self.imageView.image = self.mainImage;
        
    self.phoneNumberLabel.text = self.data.phoneNumber;
    self.phoneNumberLabel.frame = self.phoneNumberLabelFrame;
    
    self.addressLabel.text = self.data.address;
    self.addressLabel.frame = self.addressLabelFrame;

    self.reviewLabel.text = self.data.review;
    self.reviewLabel.frame = self.reviewLabelFrame;
    
    [self setupDetailsView];
}


- (void)backButtonPressed
{
    if ([self.delegate respondsToSelector:@selector(backButtonPressed)])
    {
        [self.delegate backButtonPressed];
    }
}

@end
