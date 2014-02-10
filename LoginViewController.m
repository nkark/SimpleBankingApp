//
//  LoginViewController.m
//  Assignment1
//
//  Created by Nitin Karki on 2/9/14.
//  Copyright (c) 2014 Nitin Karki. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //RETURN KEY HIDES KEYBOARD
    [self.passwordTextField addTarget:self.passwordTextField
                              action:@selector(resignFirstResponder)
                    forControlEvents:UIControlEventEditingDidEndOnExit];
    
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(didSwipeLeft:)];
    
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self.loginLabel addGestureRecognizer:leftSwipe];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) didSwipeLeft: (UISwipeGestureRecognizer *) sender
{
    if([self.passwordTextField.text isEqual: @"asu"])
    {
        self.loginLabel.text = @"password is correct";
    }
    else
    {
        UIAlertView *loginAlert = [[UIAlertView alloc] initWithTitle:@"Login Failed" message:@"Incorrect Password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [loginAlert show];
    }
}
@end
