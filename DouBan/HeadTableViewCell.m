//
//  HeadTableViewCell.m
//  DouBan
//
//  Created by Mac on 2018/7/2.
//  Copyright © 2018 Mac. All rights reserved.
//

#import "HeadTableViewCell.h"
#import <Masonry.h>
@interface HeadTableViewCell()
@property(nonatomic,strong) UIImageView *headImage;
@property(nonatomic,strong) UILabel *namelabel;
@end

@implementation HeadTableViewCell

- (instancetype)init
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SecondCell"];
    if (self) {
        [self masLayoutSubview];
    }
    return self;
}

- (UIImageView *)headImage
{
    if (!_headImage)
    {
        _headImage = [[UIImageView alloc]init];
        _headImage.image = [UIImage imageNamed:@"xihuan"];
    }
    return _headImage;
}

- (UILabel *)namelabel
{
    if (!_namelabel)
    {
        _namelabel = [[UILabel alloc]init];
        _namelabel.textColor = [UIColor blackColor];
        _namelabel.text = @"一群大佬";
    }
    return _namelabel;
}

- (void)masLayoutSubview
{
    [self.contentView addSubview:self.headImage];
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    [self.contentView addSubview:self.namelabel];
    [self.namelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headImage.mas_right).mas_offset(20);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
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
