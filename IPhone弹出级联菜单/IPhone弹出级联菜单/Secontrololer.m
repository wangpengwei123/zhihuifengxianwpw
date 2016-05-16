//
//  Secontrololer.m
//  级联菜单
//
//  Created by NewTouch on 16/4/6.
//  Copyright © 2016年 冷武橘. All rights reserved.
//

#import "Secontrololer.h"
#import "MenuController.h"
@interface Secontrololer (){
    UIButton *button;
    UIBarButtonItem *foodItem;

}
@property(nonatomic,assign)BOOL Isno;
@end

@implementation Secontrololer

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.translucent=YES;
    button=[[UIButton alloc]init];
    button.frame=CGRectMake(30, 90, 200, 200);
    //阴影颜色
    button.layer.shadowColor = [UIColor yellowColor].CGColor;
    //阴影透明度   Opacity：不透明度
    button.layer.shadowOpacity = 1;
    button.layer.shadowRadius = 10;
    button.backgroundColor=[UIColor grayColor];
    // 边框
    button.layer.borderColor=[UIColor whiteColor].CGColor;
    button.layer.borderWidth=3;
    //圆角半径
    button.layer.cornerRadius=100;
    [button addTarget:self action:@selector(clik) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitle:@"点我啊" forState:UIControlStateNormal];
    [self.view addSubview:button];
  
}
-(void)clik{
    _Isno=!_Isno;
    if(_Isno==YES){
        button.backgroundColor=[UIColor redColor];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];        NSLog(@"1");
    }
    else{
        button.backgroundColor=[UIColor grayColor];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        NSLog(@"2");
    }
    
}
//隐藏状态栏
-(BOOL)prefersStatusBarHidden{
    return YES;
}
@end
