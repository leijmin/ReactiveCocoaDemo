//
//  JMTableViewCell.m
//  ReactiveCocoaDemo
//
//  Created by lanren on 16/5/16.
//  Copyright © 2016年 雷建民. All rights reserved.
//

#import "JMTableViewCell.h"

@interface JMTableViewCell ()

@property (nonatomic,retain)UIImageView   *movieImageView;

@property (nonatomic,retain)UILabel       *titleLabel;

@property (nonatomic,retain)UILabel       *ratingLabel;

@property (nonatomic,retain)UILabel       *timeLabel;


@end

@implementation JMTableViewCell

- (void)jm_setupViews
{
     [self.contentView addSubview:self.movieImageView];
     [self.contentView addSubview:self.titleLabel];
     [self.contentView addSubview:self.ratingLabel];
     [self.contentView addSubview:self.timeLabel];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
}


- (void)updateConstraints
{
    WS(weakSelf)
    
    [self.movieImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.size.mas_equalTo(CGSizeMake(40 , 50));
        make.left.equalTo(weakSelf.contentView).with.offset(5);
        make.top.equalTo(weakSelf.contentView).with.offset(5);
        
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.size.mas_equalTo(CGSizeMake(200, 20));
        make.left.equalTo(weakSelf.contentView).with.offset(50);
        make.top.equalTo(weakSelf.contentView).with.offset(5);

        
    }];
    
    [self.ratingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(200, 20));
        make.left.equalTo(weakSelf.contentView).with.offset(50);
        make.top.equalTo(weakSelf.contentView).with.offset(30);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(200, 20));
        make.left.equalTo(weakSelf.contentView).with.offset(50);
        make.top.equalTo(weakSelf.contentView).with.offset(55);
    }];
    
    [super updateConstraints];
}

- (void)setModel:(JMModel *)model
{
    if (!model) {
        return;
    }
    
    _model = model;
    
 
    self.titleLabel.text  = model.title;
    self.ratingLabel.text = string(@"评分： ",model.rating);
    self.timeLabel.text   = string(@"上映日期： ", model.pubdate);
    [self.movieImageView sd_setImageWithURL:URL(model.images[@"small"]) placeholderImage:ImageNamed(@"picholder")];
}

#pragma mark -- lazyLoad -- 

- (UIImageView *)movieImageView
{
    if (!_movieImageView) {
        _movieImageView = [[UIImageView alloc]init];
    }
    return _movieImageView;
}

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
    }
    return _timeLabel;
}

- (UILabel *)ratingLabel
{
    if (!_ratingLabel) {
        _ratingLabel = [[UILabel alloc]init];
    }
    return _ratingLabel;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
    }
    return _titleLabel;
}


@end
