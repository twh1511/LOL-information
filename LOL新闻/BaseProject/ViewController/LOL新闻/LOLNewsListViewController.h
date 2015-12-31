//
//  LOLNewsListViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LOLNewsViewModel.h"
@interface LOLNewsListViewController : UIViewController


@property (assign, nonatomic) LOLNewsType newsType;
-(instancetype)initWithNewsType:(LOLNewsType)newsType;



@end
