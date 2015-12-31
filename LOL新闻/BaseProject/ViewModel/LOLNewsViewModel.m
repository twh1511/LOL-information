

//
//  LOLNewsViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LOLNewsViewModel.h"
@interface LOLNewsViewModel()
@property (assign, nonatomic)BOOL  isRefresh;
@end


@implementation LOLNewsViewModel


-(instancetype)initWithNewsType:(LOLNewsType)newsType{
    if (self=[super init]) {
        self.newsType=newsType;
    }
    return self;
}

-(instancetype)init{
    if (self=[super init]) {
        NSAssert1(NO, @"%s必须使用initWithLastPath:初始化", __FUNCTION__);
    }
    return self;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    NSLog(@"lastPath=%@",_lastPath);
    self.dataTask=[LOLNewsNetManager getLOLNewsModelWithLastPath:_lastPath completionHandle:^(LOLNewsModel* model, NSError *error) {
        self.lastPath=model.next;
        if (error==nil) {//网络获取数据没出错,错误有很多种包括没网
            if (_isRefresh==YES) {
                [self.dataArr removeAllObjects];
            }
            if ([model.next isEqualToString:@""]==NO) {/**不是最后一页*/
                [self.dataArr addObjectsFromArray:model.list];
                completionHandle(nil);
            }else{
                NSError *error1=[NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"没有更多数据"}];
                completionHandle(error1);
            }
        }else{
             NSLog(@"error");
            completionHandle(error);
        }
        
    }];
}



-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    switch (_newsType) {
        case LOLNewsTypeNew:/**最新*/
            _lastPath=@"c12_list_1.shtml";
            break;
        case LOLNewsTypeCompetition:/**赛事*/
            _lastPath=@"c73_list_1.shtml";
            break;
        case LOLNewsTypeVideo:/**视频*/
            _lastPath=@"c11_list_1.shtml";
            break;
        case LOLNewsTypeRecreation:/**娱乐*/
            _lastPath=@"c18_list_1.shtml";
            break;
        case LOLNewsTypeOfficial:/**官方*/
            _lastPath=@"c3_list_1.shtml";
            break;
        case LOLNewsTypeStrategy:/**攻略*/
            _lastPath=@"c10_list_1.shtml";
            break;
        case LOLNewsTypeActivity:/**活动*/
            _lastPath=@"c23_list_1.shtml";
            break;
        case LOLNewsTypeAd:/**小广告*/
            _lastPath=@"c13_list_1.shtml";
            return ;
        default:
            NSAssert1(NO, @"%s没有你要的类型", __FUNCTION__);
            break;
    }
    self.isRefresh=YES;
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    self.isRefresh=NO;
    [self getDataFromNetCompleteHandle:completionHandle];
}

/**行数*/
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
/**每行的数据 */
-(LOLNewsListModel*)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
-(NSURL *)imageURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].imageUrlSmall];
}
-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
-(NSString *)DetailForRow:(NSInteger)row{
    return [self modelForRow:row].summary;
}

-(NSString *)timeForRow:(NSInteger)row{
    /**从1970年到现在的秒数*/
    NSTimeInterval currentTime=[[NSDate date]timeIntervalSince1970];
    /**差值*/
    return @"1天前";
    
}

-(NSURL *)detailURLForRow:(NSInteger)row{
    if ([[self modelForRow:row].articleUrl rangeOfString:@"http://"].location!=NSNotFound) {
        /**有HTTP:*/
        
        return [NSURL URLWithString:[self modelForRow:row].articleUrl];
    }else{
        return [NSURL URLWithString:[NSString stringWithFormat:@"http://qt.qq.com/static/pages/news/phone/%@?APP_BROWSER_VERSION_CODE=1&ios_version=691&imgmode=auto",[self modelForRow:row].articleUrl]];
    }
}

@end
