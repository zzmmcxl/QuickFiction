//
//  BookDetailView.h
//  快读小说
//
//  Created by zzyong on 16/1/17.
//  Copyright © 2016年 zzyong. All rights reserved.
//

typedef enum {
    /** 作者*/
    DetailViewButtonAuthor,
    /** 立即阅读*/
    DetailViewButtonReadNow,
    /** 加入书架*/
    DetailViewButtonAddBookshelf,
    /** 缓存全本*/
    DetailViewButtonCacheBook,
    /** 最新章节*/
    DetailViewButtonLastChapter,
    /** 查看目录*/
    DetailViewButtonCheckChapter
    
}DetailViewButtonType;

#import <UIKit/UIKit.h>
@class DetailView;
@protocol DetailViewDelegate <UIScrollViewDelegate>

@optional
- (void) detailView:(DetailView *)detailView didButtonClickWithType:(DetailViewButtonType)type;

@end

@class BookDetailFrame;

@interface DetailView : UIScrollView

+ (instancetype) DetailView;

@property (nonatomic,strong) BookDetailFrame *bookDetailFrame;

@property (nonatomic,weak) id<DetailViewDelegate> delegate;


@end
