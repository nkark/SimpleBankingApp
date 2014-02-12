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
    self.dateArray = [[NSMutableArray alloc] init];
    return self;
}

//given a decoder pull the information out of it
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super init])) {
        self.balance = [aDecoder decodeDoubleForKey:@"Balance"];
        self.transactionArray = [aDecoder decodeObjectForKey:@"Transaction Array"];
        self.dateArray = [aDecoder decodeObjectForKey:@"Date Array"];
    }
    return self;
}

// if we're given an encoder let's save the information that we have
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeDouble:self.balance forKey:@"Balance"];
    [aCoder encodeObject:self.transactionArray forKey:@"Transaction Array"];
    [aCoder encodeObject:self.dateArray forKey:@"Date Array"];
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
    
    //GENERATE DATE AND TIME OF DEPOSIT
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    NSString *date = [dateFormatter stringFromDate:today];
    
    //ADD DATE TO DATE ARRAY
    [self.dateArray addObject:date];
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
    
    //GENERATE DATE AND TIME OF WITHDRAWAL
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    NSString *date = [dateFormatter stringFromDate:today];
    
    //ADD DATE TO DATE ARRAY
    [self.dateArray addObject:date];
    
}

@end
