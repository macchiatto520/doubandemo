//
//  ViewController.m
//  DouBan
//
//  Created by Mac on 2018/6/28.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "ViewController.h"
#import "SonTableViewCell.h"
#import <Masonry.h>
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>//设置ViewCtroller为tableView的代理（第1步）
@property(nonatomic,strong) UITableView *tableView;
//@property(nonatomic,strong) NSArray *plistArray;
@property(nonatomic,strong) NSArray *dataSourceArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSourceArray = @[@[@{@"name":@"喜欢",@"image":@"xihuan",@"imange":@"jiantou"},
                               @{@"name":@"日记",@"image":@"riji",@"imange":@"jiantou"},
                               @{@"name":@"相册",@"image":@"xiangce",@"imange":@"jiantou"},
                               @{@"name":@"我的广播",@"image":@"guangbo",@"imange":@"jiantou"},],
                             
                             @[@{@"name":@"电影·电视",@"image":@"dianyin",@"imange":@"jiantou"},
                               @{@"name":@"读书",@"image":@"dushu",@"imange":@"jiantou"},
                               @{@"name":@"音乐",@"image":@"yinyue",@"imange":@"jiantou"},
                               @{@"name":@"同城活动",@"image":@"huodong",@"imange":@"jiantou"},
                               @{@"name":@"豆列",@"image":@"doulie",@"imange":@"jiantou"},],
                             
                             @[@{@"name":@"钱包",@"image":@"qianbao",@"imange":@"jiantou"},
                               @{@"name":@"购物车",@"image":@"gouwuche",@"imange":@"jiantou"},],
                             ];
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"SonProperty List" ofType:@"plist"];
//    self.plistArray = [[NSArray alloc]initWithContentsOfFile:path];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    // Do any additional setup after loading the view, typically from a nib.
}






- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView//组
{
    return self.dataSourceArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section//行
{
    
    return [self.dataSourceArray[section] count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath//行的内容
{
    //从tableView缓存池中获取identifier是@"cell"的TableViewCell
    SonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil)
    {
        cell = [[SonTableViewCell alloc]init];
    }
    [cell updateDataSource:self.dataSourceArray[indexPath.section][indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath//每行的高度
{
    return 49.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section//每组顶部的距离（第1步）
{
    return 9.f;
}

- (UITableView *)tableView//设置tableView
{
    if (!_tableView)
    {
        UIView *superView = self.view;
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [superView addSubview:_tableView];
        _tableView.delegate = self;//设置ViewCtroller为tableView的代理（第2步）
        _tableView.dataSource = self;//同上
        _tableView.estimatedSectionHeaderHeight = 0.f;//每组顶部的距离（第2步）
    }
    return _tableView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
