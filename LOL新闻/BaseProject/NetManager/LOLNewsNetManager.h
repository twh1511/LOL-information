//
//  LOLNewsNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "LOLNewsModel.h"
#import "AllLOLNewsTypeModel.h"

@interface LOLNewsNetManager : BaseNetManager

/**各个资讯页面的网址类型*/
+(id)getNewsTypeModelWithCompletionHandle:(void(^)(id model,NSError*error))completionHandle;

/**news各个资讯页面的数据*/
+(id)getLOLNewsModelWithLastPath:(NSString*)lastPath kCompletionHandle;

@end
