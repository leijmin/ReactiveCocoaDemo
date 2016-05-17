//
//  JMViewController.m
//  ReactiveCocoaDemo
//
//  Created by lanren on 16/5/16.
//  Copyright © 2016年 雷建民. All rights reserved.
//

#import "JMViewController.h"
#import "JMView.h"
#import "JMViewModel.h"

@interface JMViewController ()

@property (nonatomic, strong)  JMView      *mainView;
@property (nonatomic, strong)  JMViewModel *viewModel;

@end

@implementation JMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


#pragma mark - private

//添加子视图
- (void)jm_addSubviews
{
    [self.view addSubview:self.mainView];
}
//导航栏标题
- (void)jm_layoutNavigation
{
    self.title = @"电影列表";
}

// 点击cell 回调
- (void)jm_bindViewModel
{
    @weakify(self);
    [[self.viewModel.cellClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
        
        @strongify(self);
        ViewController *viewController = [[ViewController alloc]init];
        viewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self.navigationController pushViewController:viewController animated:YES];
    }];
}

// 更新约束
- (void)updateViewConstraints
{
    WS(weakSelf)
    
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(weakSelf.view);
        
    }];
    
    [super updateViewConstraints];
}


#pragma mark - layzLoad －－

- (JMView *)mainView {
    
    if (!_mainView) {
        
        _mainView = [[JMView alloc] initWithViewModel:self.viewModel];
    }
    
    return _mainView;
}


- (JMViewModel *)viewModel {
    
    if (!_viewModel) {
        
        _viewModel = [[JMViewModel alloc] init];
    }
    
    return _viewModel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
