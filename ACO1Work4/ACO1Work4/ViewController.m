//
//  ViewController.m
//  ACO1Work4
//
//  Created by Will Saults on 11/21/12.
//  Copyright (c) 2012 Will Saults. All rights reserved.
//

#import "ViewController.h"
#define kLoginButtonTag 0
#define kShowDateTag 1

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Container view.
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    // Username label.
    UILabel *userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 90, 30)];
    [userNameLabel setText:@"Username:"];
    [userNameLabel setBackgroundColor:[UIColor clearColor]];
    
    // Login text field
    loginTextField = [[UITextField alloc] initWithFrame:CGRectMake(userNameLabel.frame.size.width,
                                                                                10,
                                                                                containerView.frame.size.width - userNameLabel.frame.size.width - 5,
                                                                                30)];
    [loginTextField setPlaceholder:@"Enter your username."];
    [loginTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [loginTextField setFont:[UIFont systemFontOfSize:14]];
    [loginTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    
    // Login button
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [loginButton setFrame:CGRectMake(containerView.frame.size.width - 105, loginTextField.frame.origin.y + loginTextField.frame.size.height + 5, 100, 30)];
    [loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [loginButton setTag:kLoginButtonTag];
    [loginButton addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    
    // Call to action
    callToAction = [[UILabel alloc] initWithFrame:CGRectMake(0, loginButton.frame.origin.y + 75, containerView.frame.size.width, 75)];
    [callToAction setText:@"Please Enter Username"];
    [callToAction setTextColor:[UIColor blueColor]];
    [callToAction setTextAlignment:NSTextAlignmentCenter];
    [callToAction setBackgroundColor:[UIColor lightGrayColor]];
    
    
    [self.view addSubview:containerView];
    [containerView addSubview:userNameLabel];
    [containerView addSubview:loginTextField];
    [containerView addSubview:loginButton];
    [containerView addSubview:callToAction];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onClick {
    if ([loginTextField.text length] > 0) {
        [callToAction setText:[NSString stringWithFormat:@"User: %@ has been logged in.", [loginTextField text]]];
    } else {
        [callToAction setText:@"Username cannot be empty."];
    }
}

@end
