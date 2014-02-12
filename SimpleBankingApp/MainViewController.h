//
//  MainViewController.h
//  Assignment1
//
//  Created by Nitin Karki on 1/26/14.
//  Copyright (c) 2014 Nitin Karki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BankAccountModel.h"

@interface MainViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *depositButton;
@property (strong, nonatomic) IBOutlet UIButton *withdrawButton;
@property (strong, nonatomic) IBOutlet UILabel *balanceLabel;
@property (strong, nonatomic) IBOutlet UITextField *depositTextField;
@property (strong, nonatomic) IBOutlet UITextField *withdrawTextField;
@property (strong, nonatomic) BankAccountModel *myAccount;
@property (strong, nonatomic) IBOutlet UIImageView *bannerImageView;


@end
