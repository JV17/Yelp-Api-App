//
//  YASearchView.m
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-28.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import "YASearchView.h"


@interface YASearchView() <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) UIView *leftPaddingView;

@end


// text field
static CGFloat const kTextFieldHeight = 50;
static CGFloat const kTextFieldFontSize = 22;
static NSString *const kTextFieldPlaceHolder = @"Enter your search";

// left padding view
static CGFloat const kLeftPaddingWidth = 10;


@implementation YASearchView

#pragma mark - Lifecycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self setupSearchView];
    }
    
    return self;
}


- (void)setupSearchView
{
    [self addSubview:self.textField];
}


#pragma mark - Custom Accessors

- (UITextField *)textField
{
    if (!_textField)
    {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, kTextFieldHeight)];
        _textField.leftView = self.leftPaddingView;
        _textField.delegate = self;
        _textField.font = [UIFont fontWithName:YALatoLightFont size:kTextFieldFontSize];
        _textField.leftViewMode = UITextFieldViewModeAlways;
        _textField.textColor = [UIColor whiteColor];
        _textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:kTextFieldPlaceHolder attributes:@{NSForegroundColorAttributeName : [[UIColor lightGrayColor] colorWithAlphaComponent:0.5]}];
        _textField.returnKeyType = UIReturnKeySearch;
        _textField.clearButtonMode = UITextFieldViewModeNever;
        _textField.tintColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    }
    
    return _textField;
}


- (UIView *)leftPaddingView
{
    if (!_leftPaddingView)
    {
        _leftPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kLeftPaddingWidth, kTextFieldHeight)];
        _leftPaddingView.backgroundColor = [UIColor clearColor];
    }
    
    return _leftPaddingView;
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    if ([self.delegate respondsToSelector:@selector(searchViewFinishedWithSearchString:)])
    {
        [self.delegate searchViewFinishedWithSearchString:textField.text];
    }
    
    return YES;
}

@end
