//
//  LOLNewsNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LOLNewsNetManager.h"
#define KLOLNewsPath @"http://qt.qq.com/static/pages/news/phone/%@"
#define KAllLOLNewsTypePath  @"http://qt.qq.com/static/pages/news/phone/index.js"
@implementation LOLNewsNetManager


+(id)getLOLNewsModelWithLastPath:(NSString *)lastPath completionHandle:(void (^)(id, NSError *))completionHandle{
    NSString*path=[NSString stringWithFormat:KLOLNewsPath,lastPath];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([LOLNewsModel objectWithKeyValues:responseObj],error);
    }];
}

+(id)getNewsTypeModelWithCompletionHandle:(void (^)(id model, NSError *error))completionHandle{
    return [self GET:KAllLOLNewsTypePath parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([AllLOLNewsTypeModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}
@end
