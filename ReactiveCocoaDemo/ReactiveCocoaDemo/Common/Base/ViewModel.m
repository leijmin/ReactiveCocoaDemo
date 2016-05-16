//
//  ViewModel.m
//  ReactiveCocoaDemo
//
//  Created by lanren on 16/5/16.
//  Copyright © 2016年 雷建民. All rights reserved.
//

#import "ViewModel.h"

@implementation ViewModel


@synthesize request  = _request;

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    ViewModel *viewModel = [super allocWithZone:zone];
    
    if (viewModel) {
        
        [viewModel jm_initialize];
    }
    return viewModel;
}

- (instancetype)initWithModel:(id)model {
    
    self = [super init];
    if (self) {
    }
    return self;
}

- (JMRequest *)request {
    
    if (!_request) {
        
        _request = [JMRequest request];
    }
    return _request;
}

- (void)jm_initialize {}

@end
