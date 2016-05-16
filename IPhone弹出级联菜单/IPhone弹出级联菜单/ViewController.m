//
//  ViewController.m
//  IPhone弹出级联菜单
//
//  Created by NewTouch on 16/4/7.
//  Copyright © 2016年 冷武橘. All rights reserved.
//

#import "ViewController.h"
#import "MenuController.h"
//#import "Secontrololer.h"
@interface ViewController ()<UIPopoverPresentationControllerDelegate>

{
    
    UIBarButtonItem *foodItem;}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

        self.navigationController.navigationBar.translucent=YES;
    self.view.backgroundColor=[UIColor whiteColor];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.layer.borderWidth=3;
    btn.layer.borderColor=[UIColor redColor].CGColor;
    btn.frame=CGRectMake (0, 0, 100, 40);
    [btn setTitle:@"点我啊" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clik1) forControlEvents:UIControlEventTouchUpInside];
    foodItem=[[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem=foodItem;
}
-(void)clik1{
 MenuController*contcontroller=[[MenuController alloc]init];
    
   // contcontroller.mb=^{
    //    Secontrololer *s=[[Secontrololer alloc]init];
   //     [self.navigationController pushViewController:s animated:YES];
   // };
     contcontroller.preferredContentSize=CGSizeMake(375, 300) ;
    contcontroller.modalPresentationStyle=UIModalPresentationPopover;
    UIPopoverPresentationController * poc=contcontroller.popoverPresentationController;
      poc.delegate=self;
    poc.barButtonItem=foodItem;
    [self presentViewController:contcontroller animated:YES completion:nil];
}

-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    
    return UIModalPresentationNone;
}
@end
