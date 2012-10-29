//
//  RuleViewController.m
//  bjpost
//
//  Created by 北野 剛史 on 12/10/30.
//  Copyright (c) 2012年 北野 剛史. All rights reserved.
//

#import "RuleViewController.h"

@interface RuleViewController ()

@end

@implementation RuleViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"タイトルと著作者名の表示";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        // Configure the cell...
        if([indexPath row] == 0) {
            cell.textLabel.text = @"タイトル";
            cell.detailTextLabel.text = @"ブラックジャックによろしく";
        } else if([indexPath row] == 1) {
            cell.textLabel.text = @"著作者名";
            cell.detailTextLabel.text = @"佐藤秀峰";
        } else if([indexPath row] == 2) {
            cell.textLabel.text = @"サイト名";
            cell.detailTextLabel.text = @"漫画 on web";
        } else if([indexPath row] == 3) {
            cell.textLabel.text = @"URL";
            cell.detailTextLabel.text = @"http://mangaonweb.com/";
        }
    }
    return cell;
}
@end
