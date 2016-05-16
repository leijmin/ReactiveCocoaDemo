//
//  JMModel.h
//  ReactiveCocoaDemo
//
//  Created by lanren on 16/5/16.
//  Copyright © 2016年 雷建民. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JMModel : NSObject

// 属性
@property (nonatomic,strong)NSString *rating;  // 评分
@property (nonatomic,strong)NSString *pubdate;  // 上映日期
@property (nonatomic,strong)NSString *title;  // 电影名
@property (nonatomic,strong)NSDictionary *images;  // 海报数组

@end
