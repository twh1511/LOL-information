//
//  LOLNewsViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "LOLNewsNetManager.h"
typedef NS_ENUM(NSUInteger,LOLNewsType){
    LOLNewsTypeNew=0,/**最新*/
    LOLNewsTypeCompetition,/**赛事*/
    LOLNewsTypeRecreation,/**娱乐*/
    LOLNewsTypeOfficial,/**官方*/
    LOLNewsTypeStrategy,/**攻略*/
    LOLNewsTypeActivity,/**活动*/
    LOLNewsTypeVideo,/**视频*/
    LOLNewsTypeAd/**广告*/
};


@interface LOLNewsViewModel : BaseViewModel




@property (assign, nonatomic)NSInteger  rowNumber;


@property (strong, nonatomic) NSString *lastPath;
@property (assign, nonatomic) LOLNewsType newsType;
-(instancetype)initWithNewsType:(LOLNewsType)newsType;

/**图片URL*/
-(NSURL*)imageURLForRow:(NSInteger)row;
/**title*/
-(NSString*)titleForRow:(NSInteger)row;
/**详情*/
-(NSString*)DetailForRow:(NSInteger)row;
/**时间*/
-(NSString*)timeForRow:(NSInteger)row;
/**详情的网址*/
-(NSURL*)detailURLForRow:(NSInteger)row;



@end
