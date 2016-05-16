//
//  TableViewCellProtocol.h
//  ReactiveCocoaDemo
//
//  Created by lanren on 16/5/16.
//  Copyright © 2016年 雷建民. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TableViewCellProtocol <NSObject>

@optional

- (void)jm_setupViews;
- (void)jm_bindViewModel;



@end
