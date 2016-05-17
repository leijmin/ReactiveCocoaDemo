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

@property (nonatomic,retain)UIImageView   *backgroundImage;

@property (nonatomic,retain)UILabel       *titleLabel;

@property (nonatomic,retain)UILabel       *ratingLabel;

@property (nonatomic,retain)UILabel       *timeLabel;


@end

@implementation JMTableViewCell

- (void)jm_setupViews
{
    [self.contentView    addSubview:self.backgroundImage];
    [self.backgroundImage addSubview:self.movieImageView];
    [self.backgroundImage addSubview:self.titleLabel];
    [self.backgroundImage addSubview:self.ratingLabel];
    [self.backgroundImage addSubview:self.timeLabel];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
}


- (void)updateConstraints
{
    WS(weakSelf)
    
    
    [self.backgroundImage mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(weakSelf.contentView).with.offset(15);
        make.top.equalTo(weakSelf.contentView).with.offset(10);
        make.right.equalTo(weakSelf.contentView).with.offset(-15);
        make.bottom.equalTo(weakSelf.contentView);
  
    }];
    
    [self.movieImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(weakSelf.backgroundImage).with.offset(10);
        make.top.equalTo(weakSelf.backgroundImage).with.offset(5);
        make.bottom.equalTo(weakSelf.backgroundImage).with.offset(-5);
        make.width.mas_offset(@100);
        
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(weakSelf.movieImageView.mas_right).offset(20);
        make.bottom.equalTo(weakSelf.ratingLabel.mas_top).with.offset(-40);
        
    }];

    [self.ratingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(weakSelf.movieImageView.mas_right).with.offset(20);
        make.bottom.equalTo(weakSelf.timeLabel.mas_top).with.offset(-40);
        
        }];

        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.left.equalTo(weakSelf.movieImageView.mas_right).with.offset(20);
        make.bottom.equalTo(weakSelf.backgroundImage.mas_bottom).with.offset(-5);
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

- (UIImageView *)backgroundImage
{
    if (!_backgroundImage) {
        _backgroundImage = [[UIImageView alloc]init];
        _backgroundImage.image = [UIImage imageNamed:@"bg_eventlistcell"];
    }
    return _backgroundImage;
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
