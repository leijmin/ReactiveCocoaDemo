//
//  JMViewModel.h
//  ReactiveCocoaDemo
//
//  Created by lanren on 16/5/16.
//  Copyright © 2016年 雷建民. All rights reserved.
//

#import "ViewModel.h"
#import "JMModel.h"

@interface JMViewModel : ViewModel

@property (nonatomic ,strong) JMModel  *model;



@property (nonatomic, strong) RACSubject *refreshEndSubject;

@property (nonatomic, strong) RACSubject *refreshUI;

@property (nonatomic, strong) RACCommand *refreshDataCommand;

@property (nonatomic, strong) RACCommand *nextPageCommand;

@property (nonatomic, strong) RACSubject *cellClickSubject;

@property (nonatomic ,strong) NSMutableArray *dataArray;


@end
