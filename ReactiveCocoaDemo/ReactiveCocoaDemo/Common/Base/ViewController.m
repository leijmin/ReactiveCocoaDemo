//
//  ViewController.m
//  ReactiveCocoaDemo
//
//  Created by lanren on 16/5/16.
//  Copyright © 2016年 雷建民. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    ViewController *viewController = [super allocWithZone:zone];
    
    @weakify(viewController)
    
    [[viewController rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
        
        @strongify(viewController)
        [viewController jm_addSubviews];
        [viewController jm_bindViewModel];
    }];
    
    [[viewController rac_signalForSelector:@selector(viewWillAppear:)] subscribeNext:^(id x) {
        
        @strongify(viewController)
        [viewController jm_layoutNavigation];
        [viewController jm_getNewData];
    }];
    
    return viewController;
}


#pragma mark - RAC
/**
 *  添加控件
 */
- (void)jm_addSubviews {}

/**
 *  绑定
 */
- (void)jm_bindViewModel {}

/**
 *  设置navation
 */
- (void)jm_layoutNavigation {}

/**
 *  初次获取数据
 */
- (void)jm_getNewData {}




@end
