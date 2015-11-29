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

@end


// labels font
static CGFloat const kFontSize = 12;


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
}


#pragma mark - Custom Accessors

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc] initWithFrame:self.imageViewFrame];
        _imageView.backgroundColor = [UIColor clearColor];
        _imageView.image = [UIImage imageWithSourceImage:self.copyrightImage scaledToWidth:self.frame.size.width * 0.25];
    }
    
    return _imageView;
}


- (CGRect)imageViewFrame
{
    return CGRectMake(CGRectGetMaxX(self.label.frame), 0, (self.frame.size.width * 0.25), self.frame.size.height);
}


- (void)setCopyrightImage:(UIImage *)copyrightImage
{
    _copyrightImage = copyrightImage;
    
    if (self.copyrightImage)
    {
        self.imageView.frame = self.imageViewFrame;
        self.imageView.image = [UIImage imageWithSourceImage:self.copyrightImage scaledToWidth:self.frame.size.width * 0.25];
    }
}


- (UILabel *)label
{
    if (!_label)
    {
        _label = [[UILabel alloc] init];
        _label.backgroundColor = [UIColor clearColor];
        _label.font = [UIFont fontWithName:YALatoLightFont size:kFontSize];
        _label.textColor = [UIColor whiteColor];
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
    }
}

@end
