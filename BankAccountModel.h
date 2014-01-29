//
//  BankAccountModel.h
//  Assignment1
//
//  Created by Nitin Karki on 1/26/14.
//  Copyright (c) 2014 Nitin Karki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankAccountModel : NSObject

@property (nonatomic) double balance;
@property (strong, nonatomic) NSMutableArray *transactionArray;

-(void)depositMoney:(double)depositAmount;
-(void)withdrawMoney:(double)withdrawAmount;
+(id)sharedModel;

@end
