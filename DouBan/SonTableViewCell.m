//
//  SonTableViewCell.m
//  DouBan
//
//  Created by Mac on 2018/7/1.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "SonTableViewCell.h"
#import <Masonry.h>
@interface SonTableViewCell ()

@property(nonatomic,strong) UILabel *nameLabel;
@property(nonatomic,strong) UIImageView *photoImageView;
@property(nonatomic,strong) UIImageView *otherImageView;
@end
@implementation SonTableViewCell

- (instancetype)init
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
        [self masLayoutSubview];
    }
    return self;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self masLayoutSubview];
    }
    return self;
}


- (void)updateDataSource:(NSDictionary *)dict
{
    self.nameLabel.text = dict[@"name"];
    self.photoImageView.image = [UIImage imageNamed:dict[@"image"]];
    self.otherImageView.image = [UIImage imageNamed:dict[@"image"]];
}

- (void)masLayoutSubview
{
    [self.contentView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(80);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    
    [self.contentView addSubview:self.photoImageView];
    [self.photoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.height.width.mas_equalTo(20);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    
    [self.contentView addSubview:self.otherImageView];
    [self.otherImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.height.width.mas_equalTo(20);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.textColor = [UIColor blackColor];
    }
    return _nameLabel;
}

- (UIImageView *)photoImageView
{
    if(!_photoImageView){
        _photoImageView = [[UIImageView alloc]init];
    }
    return _photoImageView;
}

- (UIImageView *)otherImageView
{
    if(!_otherImageView){
        _otherImageView = [[UIImageView alloc]init];
    }
    return _otherImageView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
