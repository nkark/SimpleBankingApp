//
//  MainViewController.m
//  Assignment1
//
//  Created by Nitin Karki on 1/26/14.
//  Copyright (c) 2014 Nitin Karki. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    //SET IMAGE VIEW
    [self.bannerImageView setImage:[UIImage imageNamed:@"personal-banking-banner"]];
    
    //RETURN KEY HIDES KEYBOARD
    [self.depositTextField addTarget:self.depositTextField
                  action:@selector(resignFirstResponder)
        forControlEvents:UIControlEventEditingDidEndOnExit];
    
    //RETURN KEY HIDES KEYBOARD
    [self.withdrawTextField addTarget:self.withdrawTextField
                              action:@selector(resignFirstResponder)
                    forControlEvents:UIControlEventEditingDidEndOnExit];

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //CLOSES KEYBOARD WHEN USER TOUCHES VIEW
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (IBAction)depositPressed:(id)sender
{
    //OBTAIN AMOUNT FROM DEPOSIT TEXT FIELD
    double amount = [self.depositTextField.text doubleValue];
    
    //DEPOSIT AMOUNT
    [[BankAccountModel sharedModel] depositMoney:amount];
    
    //UPDATE BALANCE LABEL
    self.balanceLabel.text = [NSString stringWithFormat:@"Current Balance: $%.2f", [[BankAccountModel sharedModel] balance]];
}

- (IBAction)withdrawPressed:(id)sender
{
    //OBTAIN AMOUNT FROM DEPOSIT TEXT FIELD
    double amount = [self.withdrawTextField.text doubleValue];
    
    //WITHDRAW AMOUNT
    [[BankAccountModel sharedModel] withdrawMoney:amount];
    
    //UPDATE BALANCE LABEL
    self.balanceLabel.text = [NSString stringWithFormat:@"Current Balance: $%.2f",[[BankAccountModel sharedModel] balance]];
}
@end
