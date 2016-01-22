//
//  BookDetailModel.h
//  快读小说
//
//  Created by zzyong on 16/1/17.
//  Copyright © 2016年 zzyong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookDetailModel : NSObject

/**id*/
@property (nonatomic,copy) NSString *ID;
/**书名*/
@property (nonatomic,copy) NSString *name;
/**类别*/
@property (nonatomic,copy) NSString *cate;
/**简介*/
@property (nonatomic,copy) NSString *desc;
/**最新章节*/
@property (nonatomic,copy) NSString *chapter_n;
/**字数*/
@property (nonatomic,copy) NSString *word;
/**作者*/
@property (nonatomic,copy) NSString *author;
/**状态*/
@property (nonatomic,assign) NSUInteger status;

@end

/*
 "id": 1000336,
 "name": "都市之纵意花丛",
 "author": "醉想你",
 "cate": "都市",
 "word": 2707188,
 "status": 1,
 "img": 1,
 "desc": "陈辰是个逆天的宅男，是的！绝对逆天！在春梦的意Y中死去，如此彪悍的行为连地藏王菩萨都不敢收他！再加上他乃是九世处男，情债累累，月老都说了，不把这些情债还清，你丫就别想投胎！好吧！带着地藏王菩萨赠送的超级泡妞笔记本，陈辰华丽丽的穿越了！既然重新来过，老爸就不能只是个科级小干部！玛尼？正部级？那是必须的！既然重新来过，前世错过的女孩今生不能再错过，前世失去的挚爱今生必须守候！可是，尼玛为什么连外国公主，国际大明星都会爱上我？简单的说，这是一个彪悍的少年肆虐都市花丛的拉风故事！",
 "catalog_t": 1408231770,
 "chapter_c": 884,
 "chapter_i": 890,
 "chapter_n": "终章：长相思，莫相忘！（大结局）"
 */