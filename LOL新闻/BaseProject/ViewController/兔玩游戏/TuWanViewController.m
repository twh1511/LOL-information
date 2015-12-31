//
//  TuWanViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanViewController.h"
#import "TuWanViewModel.h"
#import "TuWanListViewController.h"

@interface TuWanViewController ()
@end
@implementation TuWanViewController

+ (UINavigationController *)standardTuWanNavi{
    static UINavigationController *navic = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        TuWanViewController *vc = [[TuWanViewController alloc] initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemNames]];
//例如设置第一个控制器的某个属性的值, KVC
//vc setValue:[values[0]] forKey:keys[0]
        vc.keys = [self vcKeys];
        vc.values = [self vcValues];
        navic = [[UINavigationController alloc] initWithRootViewController:vc];
        
        navic.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"更多资讯" image:[UIImage imageNamed:@"battle_assist_stamp"]
                                             selectedImage:[UIImage imageNamed:@"battle_assist_icon"]];
        // 3.设置item中文字被选中时的样式
        NSMutableDictionary *selectedAttrbiutes = [NSMutableDictionary dictionary];
        selectedAttrbiutes[NSForegroundColorAttributeName] = KNaviTitleColor;
        [navic.tabBarItem setTitleTextAttributes:selectedAttrbiutes forState:UIControlStateSelected];
        
    });
    return navic;
}
/** 提供每个VC对应的values值数组 */
+ (NSArray *)vcValues{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i <[self itemNames].count; i++) {
//数值上，vc的infoType的枚举值 恰好和i值相同
        [arr addObject:@(i)];
    }
    return arr;
}
/** 提供每个VC对应的key值数组 */
+ (NSArray *)vcKeys{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:@"infoType"];
    }
    return [arr copy];
}

/** 提供题目数组 */
+ (NSArray *)itemNames{
    return @[@"头条",@"独家",@"暗黑3",@"魔兽",@"风暴",@"炉石",@"星际2",@"守望",@"图片",@"视频",@"攻略",@"幻化",@"趣闻",@"COS",@"美女"];
}
/** 提供每个题目对应的控制器的类型。题目和类型数量必须一致 */
+ (NSArray *)viewControllerClasses{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:[TuWanListViewController class]];
    }
    return [arr copy];
}


/**这样才会使得tabbar上有项*/
-(instancetype)initWithViewControllerClasses:(NSArray *)classes andTheirTitles:(NSArray *)titles{
    if (self=[super initWithViewControllerClasses:classes andTheirTitles:titles]) {
        self.view.backgroundColor = [UIColor greenSeaColor];
        self.title = @"更多资讯";
    }
    return self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
