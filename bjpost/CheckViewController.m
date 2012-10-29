//
//  CheckViewController.m
//  bjpost
//
//  Created by 北野 剛史 on 12/10/30.
//  Copyright (c) 2012年 北野 剛史. All rights reserved.
//

#import "CheckViewController.h"
#import <Social/Social.h>
@interface CheckViewController (){
    IBOutlet UIImageView *postImageView;
}
-(IBAction)postFacebook:(id)sender;

@end

@implementation CheckViewController

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
    UIImage *baseimage = [UIImage imageNamed:[NSString stringWithFormat:@"bj_%d.png",_image_no]];
    UIGraphicsBeginImageContext(postImageView.frame.size);
    [baseimage drawInRect:postImageView.frame];
    if([_posttext length] > 12) {
        [[_posttext substringToIndex:12] drawInRect:CGRectMake(280, 80, 20, 230) withFont:[UIFont systemFontOfSize:[UIFont systemFontSize]] lineBreakMode:NSLineBreakByWordWrapping];
        [[_posttext substringFromIndex:12] drawInRect:CGRectMake(250, 80, 20, 230) withFont:[UIFont systemFontOfSize:[UIFont systemFontSize]] lineBreakMode:NSLineBreakByWordWrapping];
    } else {
        [_posttext drawInRect:CGRectMake(280, 80, 20, 230) withFont:[UIFont systemFontOfSize:[UIFont systemFontSize]] lineBreakMode:NSLineBreakByWordWrapping];
    }
    
    UIImage *resultimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    postImageView.image = resultimage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)postFacebook:(id)sender{
    NSString *rule  = @"ブラックジャックによろしく 佐藤秀峰 ";
    NSString *rule2 = @"漫画 on web http://mangaonweb.com/";
    //ポストデータ用画像作成
    CGSize size = postImageView.frame.size;
    size.height += 50;
    UIGraphicsBeginImageContext(size);
    [postImageView.image drawInRect:postImageView.frame];
     [rule  drawInRect:CGRectMake(20, postImageView.frame.size.height, postImageView.frame.size.width, 25) withFont:[UIFont systemFontOfSize:[UIFont systemFontSize]] lineBreakMode:NSLineBreakByWordWrapping];
    [rule2  drawInRect:CGRectMake(20, postImageView.frame.size.height+25, postImageView.frame.size.width, 25) withFont:[UIFont systemFontOfSize:[UIFont systemFontSize]] lineBreakMode:NSLineBreakByWordWrapping];
    UIImage *resultimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    SLComposeViewController *facebookPostVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [facebookPostVC setInitialText:[rule stringByAppendingString:rule2]];
    [facebookPostVC addImage:resultimage];
    [self presentViewController:facebookPostVC animated:YES completion:nil];
}

@end
