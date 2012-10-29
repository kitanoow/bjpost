//
//  EditViewController.m
//  bjpost
//
//  Created by 北野 剛史 on 12/10/30.
//  Copyright (c) 2012年 北野 剛史. All rights reserved.
//

#import "EditViewController.h"
#import "CheckViewController.h"

@interface EditViewController ()
{
    IBOutlet UITextView *textView;
}
@end

@implementation EditViewController

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
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]
                     initWithTitle:@"決定"
                     style:UIBarButtonItemStylePlain
                     target:self
                     action:@selector(goCheck:)];
    self.navigationItem.rightBarButtonItem = btn;
    [textView becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)goCheck:(id)sender{
    CheckViewController *viewController = [[CheckViewController alloc] init];
    viewController.image_no = _image_no;
    viewController.posttext = textView.text;
    viewController.title = @"投稿画面";
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
