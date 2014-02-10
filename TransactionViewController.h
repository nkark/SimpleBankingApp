//
//  TransactionViewController.h
//  Assignment1
//
//  Created by Nitin Karki on 1/26/14.
//  Copyright (c) 2014 Nitin Karki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface TransactionViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *transactionTableView;

@end
