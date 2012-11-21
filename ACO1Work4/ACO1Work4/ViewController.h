//
//  ViewController.h
//  ACO1Work4
//
//  Created by Will Saults on 11/21/12.
//  Copyright (c) 2012 Will Saults. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate> {
    UITextField *loginTextField;
    UILabel *callToAction;
    UILabel *createdByLabel;
}

-(void)onClick:(id)sender;

@end
