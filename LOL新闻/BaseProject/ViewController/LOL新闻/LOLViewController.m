#import "LOLViewController.h"
#import "LOLNewsListViewController.h"
@interface LOLViewController ()

@end

@implementation LOLViewController

+(UINavigationController*)sharedLOLNavic{
    static UINavigationController*navic=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        LOLViewController*lolVC=[[LOLViewController alloc]initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemNames]];
        lolVC.keys=[self vcKeys];
        lolVC.values=[self vcValues];
        navic=[[UINavigationController alloc]initWithRootViewController:lolVC];
        
        //获取本项在tabbar中的风格,并设置好选中图片
        navic.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"更多资讯" image:[UIImage imageNamed:@"btn_home_n"]
                                              selectedImage:[UIImage imageNamed:@"btn_home_h"]];
        // 3.设置item中文字被选中时的样式
        NSMutableDictionary *selectedAttrbiutes = [NSMutableDictionary dictionary];
        selectedAttrbiutes[NSForegroundColorAttributeName] = KNaviTitleColor;
        [navic.tabBarItem setTitleTextAttributes:selectedAttrbiutes forState:UIControlStateSelected];
    });
    return navic;
}


/**对应key的值*/
+(NSArray*)vcValues{
    NSMutableArray*arr=[NSMutableArray new];
    for (NSInteger i=0; i<[self itemNames].count; i++){
        [arr addObject:@(i)];
    }
    return [arr copy];
}

/**提供每个题目对应的key值数组*/
+(NSArray*)vcKeys{
    NSMutableArray*arr=[NSMutableArray new];
    for (NSInteger i=0; i<[self itemNames].count; i++) {
        [arr addObject:@"newsType"];
    }
    return [arr copy];
}
/**提供题目数组*/
+(NSArray*)itemNames{
    return @[@"最新",@"赛事",@"娱乐",@"官方",@"攻略",@"活动"];
}
/**提供每个题目对应的控制器的类型*/
+(NSArray*)viewControllerClasses{
    NSMutableArray*arr=[NSMutableArray new];
    /**这里的循环只是保持了数量与itemNames相同*/
    for (NSInteger i=0; i<[self itemNames].count; i++) {
        [arr addObject:[LOLNewsListViewController class]];
    }
    return arr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"LOL新闻";
    
}



@end
