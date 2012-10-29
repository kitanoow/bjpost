//
//  ViewController.m
//  bjpost
//
//  Created by 北野 剛史 on 12/10/30.
//  Copyright (c) 2012年 北野 剛史. All rights reserved.
//

#import "ViewController.h"
#import "EditViewController.h"
#import "RuleViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"一覧";
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]
                            initWithTitle:@"確認"
                            style:UIBarButtonItemStylePlain
                            target:self
                            action:@selector(goRule:)];
    self.navigationItem.rightBarButtonItem = btn;
}
-(void)goRule:(id)sender{
    RuleViewController *viewController = [[RuleViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"no %d",[indexPath row] + 1];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EditViewController *viewController = [[EditViewController alloc] init];
    viewController.image_no  = [indexPath row] + 1;
    viewController.title = [NSString stringWithFormat:@"no %d",[indexPath row] + 1];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
