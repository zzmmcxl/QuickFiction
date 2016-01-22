//
//  BookDetailViewController.h
//  快读小说
//
//  Created by zzyong on 16/1/17.
//  Copyright © 2016年 zzyong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BookModel;

@interface BookDetailViewController : UIViewController

@property (nonatomic,weak) BookModel *bookModel;

@end
