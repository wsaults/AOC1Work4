//
//  ViewController.m
//  ACO1Work4
//
//  Created by Will Saults on 11/21/12.
//  Copyright (c) 2012 Will Saults. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    /*
    Create another UILabel beneath with the default text "Please Enter Username".
    Add a target to the UIButton to call a function called onClick when the user presses the Login button.
    If the user has not entered any text into the UITextField, display in the UILabel, "Username cannot be empty". Otherwise, display "User: username has been logged in".
     */
    
    // Container view.
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    // Username label.
    UILabel *userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 90, 30)];
    [userNameLabel setText:@"Username:"];
    [userNameLabel setBackgroundColor:[UIColor clearColor]];
    
    // Login text field
    UITextField *loginTextField = [[UITextField alloc] initWithFrame:CGRectMake(userNameLabel.frame.size.width,
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
    
    // Call to action
    UILabel *callToAction = [[UILabel alloc] initWithFrame:CGRectMake(0, loginButton.frame.origin.y + 75, containerView.frame.size.width, 75)];
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

@end
