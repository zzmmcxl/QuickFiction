//
//  BookDetailView.m
//  快读小说
//
//  Created by zzyong on 16/1/17.
//  Copyright © 2016年 zzyong. All rights reserved.
//

#import "DetailView.h"
#import "UIImageView+WebCache.h"
#import "NSString+Extension.h"
#import "UIView+Extension.h"
#import "BookDetailFrame.h"
#import "BookDetailModel.h"
#import "MBProgressHUD+MJ.h"

//控件间的间距
#define Margin 8

@interface DetailView ()

@property (weak, nonatomic ) IBOutlet UIImageView *authorImage;
//作者
@property (weak, nonatomic ) IBOutlet UIButton    *authorButton;
//封面
@property (weak, nonatomic ) IBOutlet UIImageView *bookImage;
//字数
@property (weak, nonatomic ) IBOutlet UILabel     *numberLable;
//状态
@property (weak, nonatomic ) IBOutlet UILabel     *statueLable;
/**最新章节*/
@property (weak, nonatomic ) IBOutlet UIButton    *LastChapterButton;
//分类
@property (weak, nonatomic ) IBOutlet UILabel     *categoryLable;
//简介
@property (nonatomic, weak ) UILabel     *descLable;
/**查看目录*/
@property (weak, nonatomic ) IBOutlet UIButton    *chapterBtn;
@property (weak, nonatomic ) IBOutlet UIButton    *readNowBtn;
@property (weak, nonatomic ) IBOutlet UIButton    *addBookshelfBtn;
@property (weak, nonatomic ) IBOutlet UIButton    *cacheBookBtn;
@property (weak, nonatomic ) IBOutlet UIView      *authorContentView;
@property (nonatomic,assign) CGSize      descLableSize;

@end


@implementation DetailView

@synthesize delegate = _delegate;

- (UILabel *)descLable{
    if (_descLable == nil) {
        UILabel *desc = [[UILabel alloc] init];
        [self addSubview:desc];
        _descLable  =desc;
    }
    return _descLable;
}

- (void)awakeFromNib{
    
    self.showsVerticalScrollIndicator = NO;
    self.descLable.font               = [UIFont systemFontOfSize:13];
    self.descLable.numberOfLines      = 0;
    self.chapterBtn.tag               = DetailViewButtonCheckChapter;
    self.readNowBtn.tag               = DetailViewButtonReadNow;
    self.addBookshelfBtn.tag          = DetailViewButtonAddBookshelf;
    self.cacheBookBtn.tag             = DetailViewButtonCacheBook;
    self.LastChapterButton.tag        = DetailViewButtonLastChapter;
    self.authorButton.tag             = DetailViewButtonAuthor;
    
    //设置圆角
    UIView *contenView = self.subviews.firstObject;
    for (UIButton *view in contenView.subviews) {
        [self setButtonCornerRadius:view];
    }
    for (UIView *view in self.authorContentView.subviews) {
        [self setButtonCornerRadius:view];
    }
    
}

//设置按钮的圆角
- (void) setButtonCornerRadius:(UIView *)view{
    if ([view isKindOfClass:[UIButton class]]) {
        view.layer.cornerRadius = 5;
        view.clipsToBounds = YES;
    }
}

+ (instancetype)DetailView{
    return [[[NSBundle mainBundle] loadNibNamed:@"DetailView" owner:nil options:nil] lastObject];
}

- (void)setBookDetailFrame:(BookDetailFrame *)bookDetailFrame{
    _bookDetailFrame = bookDetailFrame;
    
    //1.设置图片
    NSString *image = [NSString stringWithFormat:@"http://file.qreader.me/cover.php?id=%@",bookDetailFrame.detailModel.ID];
    NSURL *imageURL = [NSURL URLWithString:image];
    [self.bookImage sd_setImageWithURL:imageURL];
    
    //2.设置字数
    self.numberLable.text   = bookDetailFrame.detailModel.word;
    self.statueLable.text   = bookDetailFrame.detailModel.status?@"完结":@"连载中";
    self.categoryLable.text = bookDetailFrame.detailModel.cate;
    [self.LastChapterButton setTitle:[NSString stringWithFormat:@"最后更新:%@",bookDetailFrame.detailModel.chapter_n] forState:UIControlStateNormal];
    self.descLable.text     = bookDetailFrame.detailModel.desc;
    NSString *author        = [NSString stringWithFormat:@"%@作品",bookDetailFrame.detailModel.author];
    [self.authorButton setTitle:author forState:UIControlStateNormal];
    //3.重新布局
    [self setNeedsLayout];
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    //1.设置简介的frame
    self.descLable.x = Margin;
    self.descLable.y = CGRectGetMaxY(self.LastChapterButton.frame) + Margin;
    self.descLable.size = self.bookDetailFrame.descTextSize;
    
    //2.设置查看章节的位置
    self.chapterBtn.y = CGRectGetMaxY(self.descLable.frame) + Margin;
    
    //3.设置scrollView滚动范围
    CGFloat high = CGRectGetMaxY(self.LastChapterButton.frame) + self.chapterBtn.height + self.bookDetailFrame.descTextSize.height + 3 * Margin + 64;
    self.contentSize = CGSizeMake(0, high);
    
    //设置作者
    self.authorButton.width = self.bookDetailFrame.nameSize.width;
    self.authorImage.x = CGRectGetMaxX(self.authorButton.frame) - 5;
}

- (IBAction)didClickButton:(UIButton *)button {
    if ([self.delegate respondsToSelector:@selector(detailView:didButtonClickWithType:)]) {
        [self.delegate detailView:self didButtonClickWithType:(int)button.tag];
    }
}
@end
