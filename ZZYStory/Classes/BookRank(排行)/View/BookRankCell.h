//
//  BookRankCell.h
//  快读小说
//
//  Created by zzyong on 16/1/16.
//  Copyright © 2016年 zzyong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BookModel;

@interface BookRankCell : UITableViewCell

@property (nonatomic,strong) BookModel *bookModel;

+ (instancetype) cellWithTableview:(UITableView *)tableview;

@end
