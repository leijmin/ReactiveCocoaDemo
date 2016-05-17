//
//  View.m
//  ReactiveCocoaDemo
//
//  Created by lanren on 16/5/16.
//  Copyright © 2016年 雷建民. All rights reserved.
//

#import "View.h"

@implementation View

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self jm_setupViews];
        [self jm_bindViewModel];
    }
    return self;
}

- (instancetype)initWithViewModel:(id<ViewProtocol>)viewModel {
    
    self = [super init];
    if (self) {
        
        [self jm_setupViews];
        [self jm_bindViewModel];
    }
    return self;
}


- (void)jm_bindViewModel {
}

- (void)jm_setupViews {
}




@end
