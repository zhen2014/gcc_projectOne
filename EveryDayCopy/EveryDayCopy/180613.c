//
//  180613.c
//  EveryDayCopy
//
//  Created by gao zhen on 2018/6/14.
//  Copyright © 2018年 gao zhen. All rights reserved.
//



if ([bannerUrl isEqualToString:KtanbingHuaganUrl]) {
    TalkBingGanViewController *ban = [TalkBingGanViewController new];
    
    ban.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:ban animated:YES];
    
}else{
    
    BannerDetailVC *ban = [BannerDetailVC new];
    ban.Urlstr = bannerUrl;
    ban.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:ban animated:YES];
    
}

#include "180613.h"
if (count == 1) {
    NSString *imageName;
    for (int i = 0; i<self.banderMarr.count; i++) {
        NSString *positionStr = [NSString stringWithFormat:@"%@",[[self.banderMarr objectAtIndex:i] objectForKey:@"position"]];
        if ([positionStr isEqualToString:@"1"]) {
            imageName = [NSString stringWithFormat:@"%@",[[self.banderMarr objectAtIndex:i] objectForKey:@"img"]];
        }
    }
    imageName = [NSString stringWithFormat:@"%@%@",ImageUrl,imageName];
    UIImageView *banImgOne = [UIImageView creatImageviewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, searchViewHeight) imaged:[UIImage imageNamed:@"kong"]];
    [BannerView addSubview:banImgOne];
    [banImgOne sd_setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:[UIImage imageNamed:@"contentMren"]];
    banImgOne.userInteractionEnabled = YES;
    UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(picTouchGoges)];
    [banImgOne addGestureRecognizer:ges];
    BannerView.height = CGRectGetMaxY(banImgOne.frame);
    
}else if (count == 3){
    
    
    
    
    
    
    
    //        UIImageView *banImg = [[UIImageView alloc]init];
    //        banImg.frame = CGRectMake(0, 0, SCREEN_WIDTH, searchViewHeight);
    //        [BannerView addSubview:banImg];
    //
    //        NSString *strinag = [NSString stringWithFormat:@"%@%@",ImageUrl,bannerPic];
    //        [banImg sd_setImageWithURL:[NSURL URLWithString:strinag] placeholderImage:[UIImage imageNamed:@"contentMren"]];
    //        banImg.userInteractionEnabled = YES;
    //        UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(picTouchGoges)];
    //        [banImg addGestureRecognizer:ges];
    
    //#pragma mark 234 横幅
    //        BannerViewTwo = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(BannerView.frame)+5,SCREEN_WIDTH/2-1,searchViewHeight)];
    //        [backView addSubview:BannerViewTwo];
    //        BannerViewTwo.backgroundColor = [UIColor yellowColor];
    //
    //
    //        BannerViewThree = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(BannerViewTwo.frame)+1,CGRectGetMaxY(BannerView.frame)+5,SCREEN_WIDTH/2-1,searchViewHeight)];
    //        [backView addSubview:BannerViewThree];
    //        BannerViewThree.backgroundColor = [UIColor blueColor];
    //
    //
    //
    //        BannerViewFour = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(BannerViewThree.frame)+5,SCREEN_WIDTH,searchViewHeight)];
    //        [backView addSubview:BannerViewFour];
    //        BannerViewFour.backgroundColor = [UIColor redColor];
    
    
    
