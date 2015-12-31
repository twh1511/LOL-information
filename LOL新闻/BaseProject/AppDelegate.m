//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "LOLNewsNetManager.h"
#import "LOLViewController.h"
#import "TuWanViewController.h"
#import "SearchViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self initializeWithApplication:application];
    
    UITabBarController*tabBarController=[[UITabBarController alloc]init];
    
    
    UINavigationController*LOLNavic=[LOLViewController sharedLOLNavic];
    UINavigationController*tuWanNavic=[TuWanViewController standardTuWanNavi];

    UINavigationController*searchNavic=[SearchViewController sharedSearchNavic];
    LOLNavic.navigationItem.title=@"LOL新闻";
    searchNavic.navigationItem.title=@"召唤师查询";
    tuWanNavic.navigationItem.title=@"更多资讯";
    
    [tabBarController setViewControllers:@[LOLNavic,tuWanNavic,searchNavic]];
    self.window.rootViewController=tabBarController;
    
  
    
    [self configGlobalUIStyle];//导航栏样式
    [self tabbarStyle]; /**设tabbar置样式*/
//    [self test];
    
    
    return YES;
}


/**window的懒加载*/
-(UIWindow *)window{
    if (_window==nil) {
        _window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
}
/**tabbar样式*/
-(void)tabbarStyle{
    UITabBar*tabbar=[UITabBar appearance];
    [tabbar setBackgroundColor:[UIColor whiteColor]];
    tabbar.selectedImageTintColor=KNaviTitleColor;
    
    
    
    UITabBarItem*tabbarItem=[UITabBarItem appearance];
    [tabbarItem setTitlePositionAdjustment:(UIOffsetMake(0, -1))];
    
    NSMutableDictionary *normalAttrbiutes = [NSMutableDictionary dictionary];
    
    normalAttrbiutes[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    [tabbarItem setTitleTextAttributes:normalAttrbiutes forState:UIControlStateNormal];
    // 3.设置item中文字被选中时的样式
    NSMutableDictionary *selectedAttrbiutes = [NSMutableDictionary dictionary];
    selectedAttrbiutes[NSForegroundColorAttributeName] = KNaviTitleColor;//选中时文字颜色
    selectedAttrbiutes[NSBackgroundColorAttributeName] = KNaviTitleColor;
    selectedAttrbiutes[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    [tabbarItem setTitleTextAttributes:selectedAttrbiutes forState:UIControlStateSelected];
    
}

/**配置全局UI的样式*/
-(void)configGlobalUIStyle{
    /**导航栏不透明 */
    [UINavigationBar appearance].translucent=NO;
    /** 导航控制器的导航栏是一个单例,所有的导航控制器都公用这一个,只是显示时各不相同 */
    [[UINavigationBar appearance]setTranslucent:NO];
    /**设置导航栏背景图*/
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg_64"] forBarMetrics:UIBarMetricsDefault];
    /** 配置导航栏题目的样式*/
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont flatFontOfSize:KNaviTitleFontSize],NSForegroundColorAttributeName:KNaviTitleColor}];
    /**设置导航栏的返回按钮的颜色*/
    [[UINavigationBar appearance]setTintColor:KNaviTitleColor];
    
}


-(void)test{
    [LOLNewsNetManager getLOLNewsModelWithLastPath:@"c12_list_1.shtml" completionHandle:^(id model, NSError *error) {
        
        
    }];
    [LOLNewsNetManager getNewsTypeModelWithCompletionHandle:^(id model, NSError *error) {
        
    }];
     
}
@end
