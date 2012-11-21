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

#define kLeftHandPadding 5

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
     
     Display a UIAlertView with the current date and time displayed in the format seen in the dateAlert graphic in the assets section of this project assignment. You can either format the date and time manually or use the date and time styles. You must use an NSDate object to gather the date and time information.
     */

    // Container view.
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    // Username label.
    UILabel *userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(kLeftHandPadding, 10, 90, 30)];
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
    [loginButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // Call to action
    callToAction = [[UILabel alloc] initWithFrame:CGRectMake(0, loginButton.frame.origin.y + 75, containerView.frame.size.width, 75)];
    [callToAction setText:@"Please Enter Username"];
    [callToAction setTextColor:[UIColor blueColor]];
    [callToAction setTextAlignment:NSTextAlignmentCenter];
    [callToAction setBackgroundColor:[UIColor lightGrayColor]];
    
    // Show date button
    UIButton *showDateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [showDateButton setFrame:CGRectMake(kLeftHandPadding, callToAction.frame.origin.y + 150, 100, 50)];
    [showDateButton setTitle:@"Show Date" forState:UIControlStateNormal];
    [showDateButton setTag:kShowDateTag];
    [showDateButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:containerView];
    [containerView addSubview:userNameLabel];
    [containerView addSubview:loginTextField];
    [containerView addSubview:loginButton];
    [containerView addSubview:callToAction];
    [containerView addSubview:showDateButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onClick:(id)sender {
    switch ([sender tag]) {
        case kLoginButtonTag:
            if ([loginTextField.text length] > 0) {
                [callToAction setText:[NSString stringWithFormat:@"User: %@ has been logged in.", [loginTextField text]]];
            } else {
                [callToAction setText:@"Username cannot be empty."];
            }
            break;
        case kShowDateTag:
        {
            NSDate *dateToDisplay = [NSDate date];
            NSDateFormatter *formatter = [NSDateFormatter new];
            [formatter setDateFormat:@"MMMM dd, yyyy HH:mm:ss a zzzz"];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Date"
                                                            message:[NSString stringWithFormat:@"%@",[formatter stringFromDate:dateToDisplay]]
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil, nil];
            [alert show];
            break;
        }
        default:
            break;
    }
}

@end
