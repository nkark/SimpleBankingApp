//
//  TransactionViewController.m
//  Assignment1
//
//  Created by Nitin Karki on 1/26/14.
//  Copyright (c) 2014 Nitin Karki. All rights reserved.
//

#import "TransactionViewController.h"

@interface TransactionViewController ()

@end

@implementation TransactionViewController

- (NSString *)documentsDirectory
{
    // a tilde usually refers to your "home"
    // so we ask for a path to <our applications home>/Documents
    return [@"~/Documents" stringByExpandingTildeInPath];
}
- (NSString *)dataFilePath
{
    // this will return <our applications home>/Documents/BankModel.plist
    // if we write here the system will generate a new file in the Documents folder
    // if we wanted to save many files we could just append different files to the path
    return [[self documentsDirectory] stringByAppendingPathComponent:@"BankModel.plist"];
    
}

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
    
    //PUSHES CELLS DOWN BELOW NAVIGATION BAR
    [self.transactionTableView setContentInset:UIEdgeInsetsMake(64, self.transactionTableView.contentInset.left, self.transactionTableView.contentInset.bottom, self.transactionTableView.contentInset.right)];
    
    [self loadBankModel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.transactionTableView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BankAccountModel sharedModel] transactionArray] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.textLabel.text = [[[BankAccountModel sharedModel] transactionArray] objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [[[BankAccountModel sharedModel] dateArray] objectAtIndex:indexPath.row];
    
    [self saveBankModel];
    return cell;
}

- (void)saveBankModel
{
    
    // create a generic data storage object
    NSMutableData *data = [[NSMutableData alloc] init];
    
    // tell the archiver to use the storage we just allocated
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
  
    [archiver encodeDouble:[[BankAccountModel sharedModel] balance]  forKey:@"Balance"];
    [archiver encodeObject:[[BankAccountModel sharedModel] transactionArray]  forKey:@"Transaction Array"];
    [archiver encodeObject:[[BankAccountModel sharedModel] dateArray]  forKey:@"Date Array"];
   
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically:YES];
}

-(void)loadBankModel
{
    NSString *path = [self dataFilePath];
    
    //do we have anything in our documents directory?  If we have anything then load it up
    if ([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        
        // make an unarchiver, and point it to our data
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        
        BankAccountModel *model = [BankAccountModel sharedModel];
        model.balance = [unarchiver decodeDoubleForKey:@"Balance"];
        model.transactionArray = [unarchiver decodeObjectForKey:@"Transaction Array"];
        model.dateArray = [unarchiver decodeObjectForKey:@"Date Array"];
        
        [unarchiver finishDecoding];
    }
}

@end
