//
//  BankAccountModel.m
//  Assignment1
//
//  Created by Nitin Karki on 1/26/14.
//  Copyright (c) 2014 Nitin Karki. All rights reserved.
//

#import "BankAccountModel.h"

static BankAccountModel *sharedModel;

@implementation BankAccountModel

-(id)init
{
    self.transactionArray = [[NSMutableArray alloc] init];
    return self;
}

+(id)sharedModel
{
    if(!sharedModel)
        sharedModel = [[BankAccountModel alloc] init];
    
    return sharedModel;
}

-(void)depositMoney:(double)depositAmount
{
    //ADD AMOUNT TO BALANCE
    self.balance = self.balance + depositAmount;
    
    //GENERATE TRANSACTION STRING
    NSString *transaction = [NSString stringWithFormat:@"Deposit made of $%.2f", depositAmount];
    
    //NSLOG THE TRANSACTION INFORMATION
    NSLog(@"%@",transaction);
    
    //ADD TRANSACTION TO HISTORY
    [self.transactionArray addObject:transaction];
}

-(void)withdrawMoney: (double)withdrawAmount
{
    if(self.balance > withdrawAmount)
    {
        //SUBTRACT AMOUNT FROM BALANCE
        self.balance = self.balance - withdrawAmount;
    }
    else
    {
        NSLog(@"Insufficient funds.");
        
        UIAlertView *withdrawAlert = [[UIAlertView alloc]
                                        initWithTitle:@"Error" message:@"Insufficient Funds!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [withdrawAlert show];
    }
   

    //GENERATE TRANSACTION STRING
    NSString *transaction = [NSString stringWithFormat:@"Withdrawal made of $%.2f", withdrawAmount];
    
    //NSLOG THE TRANSACTION INFORMATION
    NSLog(@"%@",transaction);
    
    //ADD TRANSACTION TO HISTORY
    [self.transactionArray addObject:transaction];
}

@end
