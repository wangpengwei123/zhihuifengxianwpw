//
//  MenuController.m
//  IPhone弹出级联菜单
//
//  Created by NewTouch on 16/4/7.
//  Copyright © 2016年 冷武橘. All rights reserved.


#define Width    self.view.frame.size.width
#import "MenuController.h"
#import "Secontrololer.h"
#import "Student.h"
@interface MenuController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray*array;
@end

@implementation MenuController
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title=@"冷武橘的二级联动表";
//    self.navigationController.navigationBar.translucent=NO;
//    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:132/255.0 green:190/255.0 blue:220/255.0 alpha:1];
    UITableView *tableview=[UITableView new];
    tableview.frame=CGRectMake(0, 0, Width/2, 400);
    tableview.delegate=self;
    tableview.dataSource=self;
    tableview.tag=1;
    tableview.backgroundColor=[UIColor redColor];
    [self.view addSubview:tableview];
    UITableView *tableview1=[UITableView new];
    tableview1.frame=CGRectMake(Width/2, 0, Width/2, 400);
    tableview1.backgroundColor=[UIColor redColor];    tableview1.delegate=self;
    tableview1.dataSource=self;
    tableview1.tag=2;
    tableview1.backgroundColor=[UIColor grayColor];
    [self.view addSubview:tableview1];
    Student *s1=[[Student alloc]init];
    s1.name=@"上海";
    s1.arr=@[@"韩李涛",@"王鹏伟",@"尹强",@"刘可可",@"刘贵增",@"张云龙",@"梁开开",@"郭魁",@"李宁",@"王本耀",@"姚景明",@"王一博"];
    Student *s2=[[Student alloc]init];
    s2.name=@"北京";
    s2.arr=@[@"刘成成",@"张玉",@"黄明可",@"王振阳",@"张宇资"];
    Student *s3=[[Student alloc]init];
    s3.name=@"苏州";
    s3.arr=@[@"张衡",@"张全",@"桂丰尉"];
    Student *s4=[[Student alloc]init];
    s4.arr=@[@"冯晴宵",@"魏帅杰",@"嫣园园",@"郭笑冰"];
    s4.name=@"郑州";
    Student *s5=[[Student alloc]init];
    s5.name=@"扬州";
    s5.arr=@[@"王洋洋"];
    _array=@[s1,s2,s3,s4,s5];
    
    
    
}
    -(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        // 左边的表
        UITableView *tableview1=(UITableView *)[self.view viewWithTag:1];
        
        //左边的表返回的行数
        if (tableView==tableview1){
            return _array.count;
        }
        
        
        //右边的表返回的行数，根据左边的表选中的cell所决定返回了多少行
        else
        {
            Student*s= _array[tableview1.indexPathForSelectedRow.row];
            return s.arr.count;
            
        }
        
        
        
    }
    -(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        //左边的表
        UITableView *tableview1=(UITableView *)[self.view viewWithTag:1];
        
        //1.如果是左边的表
        if (tableView==tableview1){
            static NSString *identifier = @"cell";
            
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            
            cell.backgroundColor=[UIColor clearColor]
            ;
            Student *s=_array[indexPath.row];
            cell.textLabel.text=s.name;
            return cell;
        }
        
        
        //2.如果是右边的表
        else{
            static NSString *identifier = @"tableviewcell";
            
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            
            cell.backgroundColor=[UIColor clearColor]
            ;
            //2.1根据左边的表取出右边表对应的模型数据
            Student*s= _array[tableview1.indexPathForSelectedRow.row];
            NSString *str=s.arr[indexPath.row];
            cell.textLabel.text=str;
            return cell;
            
        }
        
        
        
        
        
    }
    
    //左边表点击选中来刷新右边的表
    -(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        
        UITableView *tableview1=(UITableView *)[self.view viewWithTag:1];
        UITableView *tableview2=(UITableView *)[self.view viewWithTag:2];
        if(tableView==tableview1){
            [tableview2 reloadData];
        }
        else {
          [self dismissViewControllerAnimated:YES completion:nil];
            _mb();//通过回掉跳转到Secontroller
            
            
            
            
            
        }
        
        
        
        
        
        
        
    }
    
    //隐藏状态栏
    -(BOOL)prefersStatusBarHidden{
        return YES;
    }
@end