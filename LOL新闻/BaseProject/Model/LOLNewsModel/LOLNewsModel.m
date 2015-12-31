//
//  LOLNewsModel.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LOLNewsModel.h"

@implementation LOLNewsModel


+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [LOLNewsListModel class]};
}
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"thisPageNum":@"this_page_num"};
}
@end

@implementation LOLNewsListModel

/**把所有的下划线*/
+(NSString*)replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName underlineFromCamel];
}
@end


