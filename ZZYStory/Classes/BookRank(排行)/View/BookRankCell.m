//
//  BookRankCell.m
//  快读小说
//
//  Created by zzyong on 16/1/16.
//  Copyright © 2016年 zzyong. All rights reserved.
//

#import "BookRankCell.h"
#import "BookModel.h"
#import "UIImageView+WebCache.h"

@interface BookRankCell ()

@property (nonatomic,weak) UIImageView *iconView;
@property (nonatomic,weak) UILabel     *nameView;
@property (nonatomic,weak) UILabel     *descView;

@end

@implementation BookRankCell

- (void)setBookModel:(BookModel *)bookModel{
    _bookModel = bookModel;
    //1.设置书名
    self.nameView.text = bookModel.name;
    
    //2.设置简介
    self.descView.numberOfLines = 0;
    self.descView.text = bookModel.desc;
    
    //3.设置图片
    NSString *image = [NSString stringWithFormat:@"http://file.qreader.me/cover.php?id=%@",bookModel.ID];
    NSURL *imageURL = [NSURL URLWithString:image];
    [self.iconView sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"loading_cover"]];
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //1.添加iconView
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        //2.添加nameView
        UILabel *nameView = [[UILabel alloc] init];
        [self.contentView addSubview:nameView];
        self.nameView = nameView;
        
        //3.添加descView
        UILabel *descView = [[UILabel alloc] init];
        descView.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:descView];
        self.descView = descView;
        
    }
    return self;
}

//返回自定义cell
+ (instancetype) cellWithTableview:(UITableView *)tableview{
    NSString *ID = @"mystory";
    BookRankCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[BookRankCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    CGFloat magin = 8;
    
    //1.设置iconView的位置大小
    CGFloat iconViewX = magin;
    CGFloat iconViewY = magin;
    CGFloat iconViewW = 60;
    CGFloat iconViewH = 75;
    self.iconView.frame = CGRectMake(iconViewX, iconViewY, iconViewW, iconViewH);
    
    //2.设置nameView的位置大小
    CGFloat nameViewX = CGRectGetMaxX(self.iconView.frame) + magin;
    CGFloat nameViewY = magin;
    CGFloat nameViewW = self.bounds.size.width - iconViewW - 3 * magin;
    CGFloat nameViewH = 35;
    self.nameView.frame = CGRectMake(nameViewX, nameViewY, nameViewW, nameViewH);
    
    //3.设置descView的位置大小
    CGFloat descViewX = nameViewX;
    CGFloat descViewY = magin + nameViewH;
    CGFloat descViewW = nameViewW;
    CGFloat descViewH = iconViewH - nameViewH;
    self.descView.frame = CGRectMake(descViewX, descViewY, descViewW, descViewH);
    
}

@end
