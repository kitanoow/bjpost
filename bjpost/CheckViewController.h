//
//  CheckViewController.h
//  bjpost
//
//  Created by 北野 剛史 on 12/10/30.
//  Copyright (c) 2012年 北野 剛史. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckViewController : UIViewController
@property(nonatomic,assign) int image_no;
@property(nonatomic,retain) NSString *posttext;
@property(nonatomic,retain) UIImage  *postimage;
@end
