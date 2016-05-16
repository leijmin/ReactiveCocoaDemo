//
//  ViewProtocol.h
//  ReactiveCocoaDemo
//
//  Created by lanren on 16/5/16.
//  Copyright © 2016年 雷建民. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewModelProtocol.h"

@protocol ViewProtocol <NSObject>

@optional

- (instancetype)initWithViewModel:(id <ViewModelProtocol>)viewModel;

- (void)jm_bindViewModel;
- (void)jm_setupViews;
- (void)jm_addReturnKeyBoard;



@end
