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
static NSString *const kTextFieldValidCharacters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789";

// left padding view
static CGFloat const kLeftPaddingWidth = 10;


@implementation YASearchView

#pragma mark - Lifecycle

- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self loadSearchView];
    }
    
    return self;
}


- (void)loadSearchView
{
    [self addSubview:self.textField];
    
    // don't apply autolayout if is not required
    if (self.frame.size.width == 0 || self.frame.size.height == 0)
    {
        [self applyTextFieldLayout];
    }
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
        _textField.translatesAutoresizingMaskIntoConstraints = NO;
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


#pragma mark - AutoLayout

- (void)applyTextFieldLayout
{
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_textField]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(_textField)]];

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_textField]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(_textField)]];
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [self checkForValidInputWithText:textField.text];
}


/**
 Checks for invalid inputs from the user like special characters.
 @discussion We don't want to allow any special characters from the user's input before making an api request, which could return an error.
 
 @param text 
    The text field text.
 
 @return 
    A Boolean if the text is valid or not.
 */
- (BOOL)checkForValidInputWithText:(NSString *)text
{
    if (!text.length)
    {
        return NO;
    }
    
    NSCharacterSet *characterSet = [[NSCharacterSet characterSetWithCharactersInString:kTextFieldValidCharacters] invertedSet];
    
    if ([text rangeOfCharacterFromSet:characterSet].location != NSNotFound)
    {
        return NO;
    }
    
    if ([self.delegate respondsToSelector:@selector(searchViewFinishedWithSearchString:)])
    {
        [self.textField resignFirstResponder];
        [self.delegate searchViewFinishedWithSearchString:text];
        
        return YES;
    }
    
    return NO;
}

@end
