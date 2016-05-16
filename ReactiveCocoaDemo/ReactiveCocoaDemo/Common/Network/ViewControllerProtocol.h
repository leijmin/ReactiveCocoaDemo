//
//  ViewControllerProtocol.h
//  ReactiveCocoaDemo
//
//  Created by lanren on 16/5/16.
//  Copyright © 2016年 雷建民. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewProtocol.h"

@protocol ViewControllerProtocol <NSObject>

@optional
- (instancetype)initWithViewModel:(id <ViewProtocol>)viewModel;

- (void)jm_bindViewModel;
- (void)jm_addSubviews;
- (void)jm_getNewData;
- (void)jm_layoutNavigation;

@end
