//
//  YADemoView.m
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-29.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import "YADemoView.h"


@interface YADemoView()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *label;

@end


// label
static NSString *const kDemoLabelColor = @"2B2B2B";
static NSString *const kDemoLabelShadowColor = @"4A4A4A";
static CGFloat const kDemoLabelFontSize = 20;
static CGFloat const kDemoLabelHeight = 40;
static CGFloat const kDemoLabelY = 22;


@implementation YADemoView

#pragma mark - Custom Initializers

- (instancetype)init
{
    return [self initWithFrame:CGRectZero demoImage:nil demoName:@""];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame demoImage:nil demoName:@""];
}


- (instancetype)initWithFrame:(CGRect)frame demoImage:(UIImage *)demoImage demoName:(NSString *)demoName
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        _demoImage = demoImage;
        _demoName = demoName;
        [self setupDemoView];
    }
    
    return self;
}


- (void)setupDemoView
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
        _imageView.image = self.demoImage;
    }
    
    return _imageView;
}


- (CGRect)imageViewFrame
{
    return CGRectMake(((self.frame.size.width / 2) - (self.demoImage.size.width /2)), ((self.frame.size.height / 2) - (self.demoImage.size.height /2)), self.demoImage.size.width, self.demoImage.size.height);
}


- (void)setDemoImage:(UIImage *)demoImage
{
    _demoImage = demoImage;
    
    if (self.demoImage)
    {
        self.imageView.frame = self.imageViewFrame;
        self.imageView.image = self.demoImage;
    }
}


- (UILabel *)label
{
    if (!_label)
    {
        _label = [[UILabel alloc] initWithFrame:self.labelFrame];
        _label.backgroundColor = [UIColor clearColor];
        _label.font = [UIFont fontWithName:YALatoRegular size:kDemoLabelFontSize];
        _label.textColor = [UIColor colorWithHexString:kDemoLabelColor];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.text = self.demoName;

        _label.layer.shadowOffset = CGSizeMake(2, 2);
        _label.layer.shadowRadius = 2;
        _label.layer.shadowColor = [UIColor colorWithHexString:kDemoLabelShadowColor].CGColor;
        _label.layer.shadowOpacity = 0.6;
    }
    
    return _label;
}


- (CGRect)labelFrame
{
    return CGRectMake(0, kDemoLabelY, self.frame.size.width, kDemoLabelHeight);
}


- (void)setDemoName:(NSString *)demoName
{
    _demoName = demoName;
    
    if (self.demoName.length)
    {
        self.label.text = self.demoName;
    }
}

@end
