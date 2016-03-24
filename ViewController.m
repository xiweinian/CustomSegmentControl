//
//  ViewController.m
//  CustomSegmentControl
//
//  Created by CH10 on 16/3/16.
//  Copyright © 2016年 北京全彩时代网络科技有限公司. All rights reserved.
//

typedef enum {
    selectedIndex = 0,
    startAnimation,
    itemFont,
    sliderLine,
    segmentTintColor,
    selectedItemColor,
    displayRect,
    rectColor
}index;
#import "ViewController.h"
#import "CTSegmentControl.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,CTSegmentControlDelegate>




@property (nonatomic,weak)CTSegmentControl *seg;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)NSArray *items;
@end

@implementation ViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self string:@"张惠新" hasSubstring:@"新"];
    _dataArray = [[NSMutableArray alloc] initWithArray:@[@"selectedIndex",@"startAnimation",@"itemFont",@"sliderLine",@"segmentTintColor",@"selectedItemColor",@"displayRect",@"rectColor"]];
    _items = @[@"标题1",@"标题2",@"标题3",@"标题4",@"标题5"];

    
//    CTSegmentControl *seg = [[CTSegmentControl alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 40) andItems: _items andItemFont: [UIFont systemFontOfSize:18]andDelegate:self];
    CTSegmentControl *seg = [CTSegmentControl CTSegmentControlWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 40) andItems:_items andItemFont:[UIFont systemFontOfSize:18] andDelegate:self];
    seg.segmentTintColor = [UIColor blackColor];
    seg.selectedItemColor = [UIColor redColor];
    seg.rectColor = [UIColor redColor];
    seg.displayRect = YES;
    seg.selectedIndex = 2;

    _seg =seg;
    [self.view addSubview:seg];
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    tableView.tableHeaderView = seg;
}
#pragma mark - CTSegmentControlDelegate
-(void)ctSegmentControlDidSelectedIndex:(NSInteger)index{
    NSString *mes = [NSString stringWithFormat:@"currentIndex is %ld",(long)index];
    NSLog(@"%@",mes);
    
    
/***IOS8及以上版本
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"提示" message:mes preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"%@",mes);
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"二次确认" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"%@",mes);
    }];
    [alertControl addAction:action2];
    [alertControl addAction:action1];
    [alertControl addAction:action];
    [self presentViewController:alertControl animated:YES completion:nil];
//    [self.navigationController pushViewController:alertControl animated:YES];
*/
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellName = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    if (_dataArray.count) {
        cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
//@"selectedIndex",@"startAnimation",@"itemFont",@"sliderLine",@"segmentTintColor",@"selectedItemColor",@"displayRect",@"rectColor"
    switch (indexPath.row) {
        case selectedIndex:{
             static NSInteger tindex = 0;
            if (tindex == 5) {
                tindex = 0;
            }
            _seg.selectedIndex = tindex++;
        }break;
        case startAnimation:{
            static BOOL flag = NO;
            _seg.startAnimation = flag;
            flag = !flag;
        }break;
        case itemFont:
            _seg.itemFont = [UIFont systemFontOfSize:15+arc4random()%4];
            break;
        case sliderLine:
            break;
        case segmentTintColor:
            _seg.segmentTintColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
            break;
        case selectedItemColor:
            _seg.selectedItemColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
            break;
        case displayRect:{
            static BOOL flag1 = NO;
            _seg.displayRect = flag1;
            flag1 = !flag1;
        }break;
        case rectColor:
            _seg.rectColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
            break;
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
