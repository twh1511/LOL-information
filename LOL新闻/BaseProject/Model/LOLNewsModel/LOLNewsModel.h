//
//  LOLNewsModel.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class LOLNewsListModel;
@interface LOLNewsModel : BaseModel

@property (nonatomic, strong) NSArray<LOLNewsListModel *> *list;
@property (nonatomic, copy) NSString *next;
@property (nonatomic, copy) NSString *thisPageNum;//this_page_num
@property (strong, nonatomic) NSString *previous;

@end


@interface LOLNewsListModel : NSObject

@property (nonatomic, copy) NSString *isDirect;//is_direct
@property (nonatomic, copy) NSString *channelDesc;//channel_desc
@property (nonatomic, copy) NSString *articleId;//article_id
@property (nonatomic, copy) NSString *imageSpec;//image_spec
@property (nonatomic, copy) NSString *isTop;//is_top
@property (nonatomic, copy) NSString *publicationDate;//publication_date
@property (nonatomic, copy) NSString *imageWithBtn;//image_with_btn
@property (nonatomic, copy) NSString *imageUrlBig;//image_url_big
@property (nonatomic, copy) NSString *targetid;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *channelId;//channel_id
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *articleUrl;//article_url
@property (nonatomic, copy) NSString *imageUrlSmall;//image_url_small
@property (nonatomic, copy) NSString *isNew;//is_new
@property (nonatomic, copy) NSString *insertDate;//insert_date
@property (nonatomic, copy) NSString *isAct;//is_act
@property (nonatomic, copy) NSString *score;
@property (nonatomic, copy) NSString *isHot;//is_hot

@end

