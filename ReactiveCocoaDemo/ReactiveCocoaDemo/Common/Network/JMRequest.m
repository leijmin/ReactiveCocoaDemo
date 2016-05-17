//
//  JMRequest.m
//  ReactiveCocoaDemo
//
//  Created by lanren on 16/5/16.
//  Copyright © 2016年 雷建民. All rights reserved.
//

#import "JMRequest.h"

@implementation JMRequest


+ (instancetype)request {
    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.operationManager = [AFHTTPSessionManager manager];
    }
    return self;
}


- (void)GET:(NSString *)URLString
 parameters:(NSDictionary*)parameters
    success:(void (^)(JMRequest *, id ))success
    failure:(void (^)(JMRequest *, NSError *))failure {
    
    self.operationQueue=self.operationManager.operationQueue;
    self.operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];

    [self.operationManager GET:URLString parameters:parameters   success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
         id object = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        
       NSLog(@" GET  请求成功 ");
        success(self,object);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"[JMRequest]: 请求失败 %@",error.localizedDescription);
        failure(self,error);
    }];
    
}

- (void)POST:(NSString *)URLString
  parameters:(NSDictionary*)parameters
     success:(void (^)(JMRequest *request, id response))success
     failure:(void (^)(JMRequest *request, NSError *error))failure{
    
    self.operationQueue = self.operationManager.operationQueue;
    self.operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [self.operationManager POST:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        id object = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        
        NSLog(@"[JMRequest]:POST 请求成功 %@",object);
        success(self,object);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"[JMRequest]: 请求失败 %@",error.localizedDescription);
        failure(self,error);
        
    }];
    
}

- (void)postWithURL:(NSString *)URLString parameters:(NSDictionary *)parameters {
    
    [self POST:URLString
    parameters:parameters
       success:^(JMRequest *request, id  response) {
           if ([self.delegate respondsToSelector:@selector(JMRequest:finished:)]) {
               [self.delegate JMRequest:request finished:response];
               
           }
       }
       failure:^(JMRequest *request, NSError *error) {
           if ([self.delegate respondsToSelector:@selector(JMRequest:Error:)]) {
               [self.delegate JMRequest:request Error:error.description];
           }
       }];
}

- (void)getWithURL:(NSString *)URLString {
    
    [self GET:URLString parameters:nil success:^(JMRequest *request, id response) {
        if ([self.delegate respondsToSelector:@selector(JMRequest:finished:)]) {
            [self.delegate JMRequest:request finished:response];
        }
    } failure:^(JMRequest *request, NSError *error) {
        if ([self.delegate respondsToSelector:@selector(JMRequest:Error:)]) {
            [self.delegate JMRequest:request Error:error.description];
        }
    }];
}

- (void)cancelAllOperations{
    [self.operationQueue cancelAllOperations];
}

@end
