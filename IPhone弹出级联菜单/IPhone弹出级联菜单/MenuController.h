//
//  MenuController.h
//  IPhone弹出级联菜单
//
//  Created by NewTouch on 16/4/7.
//  Copyright © 2016年 冷武橘. All rights reserved.
//

#import <UIKit/UIKit.h>
//定义block在上级保存代码，在下一级回掉
typedef void(^myblock)();
@interface MenuController : UIViewController
@property(nonatomic,strong)myblock mb;@end
