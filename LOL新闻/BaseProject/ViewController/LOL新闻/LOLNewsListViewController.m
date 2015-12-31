#import "LOLNewsListViewController.h"
#import "LOLNewsViewModel.h"
#import "LOLNewsListCell.h"
#import "LOLNewsDetailViewController.h"
@interface LOLNewsListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) LOLNewsViewModel *lolNewsVM;

@end

@implementation LOLNewsListViewController
/**这里用WMPageController进行翻页控制,所以这个初始化没有用到,只用到了newsType属性
 也就是说newstype不是在这里赋值的*/
-(instancetype)initWithNewsType:(LOLNewsType)newsType{
    if (self=[super init]) {
        self.newsType=newsType;
    }
    return self;
}


-(LOLNewsViewModel *)lolNewsVM{
    if (_lolNewsVM==nil) {
        _lolNewsVM=[[LOLNewsViewModel alloc]initWithNewsType:_newsType];
    }
    return _lolNewsVM;
}

-(UITableView *)tableView{
    if (_tableView==nil) {
        _tableView=[UITableView new];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.tableFooterView=[UIView new];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_tableView registerClass:[LOLNewsListCell class] forCellReuseIdentifier:@"cell"];
        /**给一个猜测的高度,让cell的行高*/
        _tableView.estimatedRowHeight=UITableViewAutomaticDimension;
        _tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.lolNewsVM refreshDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                    NSLog(@"出错了");
                }else{
                    [_tableView reloadData];
                    [_tableView.footer resetNoMoreData];
                }
                [_tableView.header endRefreshing];
            }];
        }];
        _tableView.footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [self.lolNewsVM getMoreDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                    if (error.code==999) {
                        [_tableView.footer endRefreshing];
                    }else{
                        [_tableView.footer endRefreshingWithNoMoreData];
                    }
                }else{
                    [_tableView reloadData];
                    [_tableView.footer endRefreshing];
                }
            }];
        }];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView.header beginRefreshing];/**调用懒加载*/
    
}

#pragma -mark-UITableView中的协议
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LOLNewsListCell*cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell.leftImageView setImageWithURL:[self.lolNewsVM imageURLForRow:indexPath.row]placeholderImage:[UIImage imageNamed:@"error"]];
    cell.titleLb.text=[self.lolNewsVM titleForRow:indexPath.row];
    cell.detailLb.text=[self.lolNewsVM DetailForRow:indexPath.row];
    cell.timeLb.text=[self.lolNewsVM timeForRow:indexPath.row];
    return cell;
}
/**多少个分区*/
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
/**多少个行*/
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.lolNewsVM.rowNumber;
}

/**行高*/
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
/**选中行*/
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    /**跳过去*/
    LOLNewsDetailViewController*vc=[[LOLNewsDetailViewController alloc]init];
    vc.url=[self.lolNewsVM detailURLForRow:indexPath.row];
    
    vc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vc animated:YES];
}
/**自动行高*/
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
@end
