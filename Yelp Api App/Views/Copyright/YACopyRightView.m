//
//  YACopyRightView.m
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-29.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import "YACopyRightView.h"


@interface YACopyRightView()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, assign, readwrite) CGFloat contentViewWidth;

@end


// labels font
static CGFloat const kYelpImagePercentage = 0.05;


@implementation YACopyRightView

#pragma mark - Lifecycle

- (instancetype)init
{
    return [self initWithFrame:CGRectZero copyrightText:@"" copyrightImage:nil];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame copyrightText:@"" copyrightImage:nil];
}


- (instancetype)initWithFrame:(CGRect)frame copyrightText:(NSString *)copyrightText copyrightImage:(UIImage *)copyrightImage
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        _copyrightText = copyrightText;
        _copyrightImage = copyrightImage;
        [self loadCopyrightView];
    }
    
    return self;
}


- (void)loadCopyrightView
{
    [self addSubview:self.label];
    [self addSubview:self.imageView];
    [self centerContentInView];
}


#pragma mark - Custom Accessors

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc] initWithFrame:self.imageViewFrame];
        _imageView.backgroundColor = [UIColor clearColor];
        _imageView.image = [UIImage imageWithSourceImage:self.copyrightImage scaledToWidth:self.imageWidth];
    }
    
    return _imageView;
}


- (CGRect)imageViewFrame
{
    return CGRectMake(CGRectGetMaxX(self.label.frame), 0, self.imageWidth, self.frame.size.height);
}


- (CGFloat)imageWidth
{
    return (self.frame.size.width * kYelpImagePercentage);
}


- (void)setCopyrightImage:(UIImage *)copyrightImage
{
    _copyrightImage = copyrightImage;
    
    if (self.copyrightImage)
    {
        self.imageView.frame = self.imageViewFrame;
        self.imageView.image = [UIImage imageWithSourceImage:self.copyrightImage scaledToWidth:self.imageWidth];
        [self centerContentInView];
    }
}


- (UILabel *)label
{
    if (!_label)
    {
        _label = [[UILabel alloc] init];
        _label.backgroundColor = [UIColor clearColor];
        _label.font = [UIFont fontWithName:YALatoRegular size:YACopyrightLabelFontSize];
        _label.textColor = [UIColor colorWithHexString:YACopyrightLabelColor];
        _label.text = self.copyrightText;
        _label.frame = self.labelFrame;
    }
    
    return _label;
}


- (CGRect)labelFrame
{
    [_label sizeToFit];
    return CGRectMake(0, 0, self.label.frame.size.width, self.frame.size.height);
}


- (void)setCopyrightText:(NSString *)copyrightText
{
    _copyrightText = copyrightText;
    
    if (self.copyrightText.length)
    {
        self.label.text = self.copyrightText;
        self.label.frame = self.labelFrame;
        [self centerContentInView];
    }
}


- (CGFloat)contentViewWidth
{
    return self.label.frame.size.width + self.imageView.frame.size.width;
}


#pragma mark - Helper Functions

- (void)centerContentInView
{
    if (self.frame.size.width > self.contentViewWidth)
    {
        CGFloat originX = ((self.frame.size.width / 2) - (self.contentViewWidth / 2));
        self.label.frame = CGRectMake(originX, 0, self.label.frame.size.width, self.label.frame.size.height);
        self.imageView.frame = self.imageViewFrame;
    }
}

@end
