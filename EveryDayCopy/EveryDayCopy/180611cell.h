//
//  180611cell.h
//  EveryDayCopy
//
//  Created by gao zhen on 2018/6/11.
//  Copyright © 2018年 gao zhen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface _80611cell : UIViewController

////懒加载  筛选页面 bgview中包含页面
//- (UIView *)bgView{
//    if (!_bgView) {
//        _bgView = [UIView createViewWithFrame:CGRectMake(0, kTopHeight+55, SCREEN_WIDTH, SCREEN_HEIGHT-55-kTopHeight-49-SafeAreaBottomHeight) bgColor:[UIColor whiteColor]];//[
//        [self.view addSubview:_bgView];
//
//
//        _textTagCollectionView1 = [[TTGTextTagCollectionView alloc]init];
//        [_bgView addSubview:_textTagCollectionView1];
//        _textTagCollectionView1.selectionLimit = 1;//限制个数
//        _textTagCollectionView1.frame = CGRectMake(10, 20, self.view.frame.size.width-20, SCREEN_HEIGHT-55-kTopHeight-49-SafeAreaBottomHeight-20);
//        _textTagCollectionView1.backgroundColor = [UIColor whiteColor];
//
//
//        _textTagCollectionView1.delegate = self;
//        _textTagCollectionView1.showsVerticalScrollIndicator = NO;
//        TTGTextTagConfig *config = _textTagCollectionView1.defaultConfig;
//        config.tagTextFont = [UIFont boldSystemFontOfSize:12.0f];
//        //文本的颜色
//        config.tagTextColor = QIANBLACKCOLOR;
//        //选中的样色
//        config.tagSelectedTextColor = JISECOLOR;
//
//        config.tagBackgroundColor = [UIColor clearColor];
//        config.tagSelectedBackgroundColor = [UIColor clearColor];
//
//        //水平竖直间距
//        if (SCREEN_WIDTH == 320) {
//
//            _textTagCollectionView1.horizontalSpacing = 12.0;
//            _textTagCollectionView1.verticalSpacing = 12.0;
//        }else if (SCREEN_WIDTH == 375 ){
//
//            _textTagCollectionView1.horizontalSpacing = 23.0;
//            _textTagCollectionView1.verticalSpacing = 15.0;
//        }else if (SCREEN_WIDTH == 414 ){
//
//            _textTagCollectionView1.horizontalSpacing = 30.0;
//            _textTagCollectionView1.verticalSpacing = 20.0;
//        }else{
//            //iPhone
//
//        }
//
//
//        //外围包裹
//        config.tagBorderColor = QIANBLACKCOLOR;
//        config.tagSelectedBorderColor = JISECOLOR;
//        config.tagBorderWidth = 1;
//        config.tagSelectedBorderWidth = 1;
//
//        //阴影
//        config.tagShadowColor = [UIColor whiteColor];
//        config.tagShadowOffset = CGSizeMake(0, 0);
//        config.tagShadowOpacity = 0.0f;
//        config.tagShadowRadius = 0.0f;
//
//        //裁剪
//        config.tagCornerRadius = 10.0;
//        config.tagSelectedCornerRadius = 10.0;
//
//        //扩展宽高
//        config.tagExtraSpace = CGSizeMake(10, 10);
//        _textTagCollectionView1.alignment = 0;
//
//
////        NSMutableArray *arrTags = [NSMutableArray array];
////        if (_tagsMarr.count >0) {
////            for (int i=0; i<_tagsMarr.count; i++) {
////                [arrTags addObject:[[_tagsMarr objectAtIndex:i] objectForKey:@"NAME"]];
////            }
////        }
//     NSArray*   arrTags = @[@"等等",@"asdf",@"的第三方",@"的速度",@"额发的",@"巅峰赛但是",@"等等的",@"大的",@"地方",@"大的",@"文身断发",@"手动阀",@"第三方",@"撒地方",@"胡歌"];
//        [_textTagCollectionView1 addTags:arrTags];
//
//
////        if (isSeletSureBtn) {
////            for (int i = 0; i<_dataSeletMarr.count; i++) {
////                NSUInteger index = [[_dataSeletMarr objectAtIndex:i] integerValue];
////                [_textTagCollectionView1 setTagAtIndex:index selected:YES];
////            }
////            [_dataSeletMarrNoSureBtn addObjectsFromArray:_dataSeletMarr];
////        }else{
////            isSeletSureBtn = NO;
////
////            [_dataSeletMarr removeAllObjects];
////        }
////
////        [_textTagCollectionView1 reload];
//
//
//
//
//        WEAKSELFS
//        UIButton *resetBtn = [UIButton createTypeTwoBtnFrame:CGRectMake(10, _bgView.height-45-SafeAreaBottomHeight, (SCREEN_WIDTH-30)/2, 35) title:@"重置" bgImageName:@"d" titleColor:JISECOLOR bgColor:[UIColor whiteColor] titleLabelFont:20 action:^(UIButton *button) {
//
//            if (isSeletSureBtn) {
//                for (int i = 0; i<_dataSeletMarr.count; i++) {
//                    NSUInteger index = [[_dataSeletMarr objectAtIndex:i] integerValue];
//                    [_textTagCollectionView1 setTagAtIndex:index selected:YES];
//                }
//                [_dataSeletMarrNoSureBtn addObjectsFromArray:_dataSeletMarr];
//            }else{
//                isSeletSureBtn = NO;
//
//                [_dataSeletMarr removeAllObjects];
//            }
//
//            [_textTagCollectionView1 reload];
//
//
//
//
//            for (int i = 0; i<_dataSeletMarrNoSureBtn.count; i++) {
//                NSInteger indexs = [_dataSeletMarrNoSureBtn[i] integerValue];
//                [_textTagCollectionView1 setTagAtIndex:indexs selected:NO];
//            }
//            [_dataSeletMarrNoSureBtn removeAllObjects];
//            [_dataSeletMarr removeAllObjects];
//
//            _signsStr = @"";
//
//        }];
//        resetBtn.layer.cornerRadius = 5;
//        resetBtn.layer.masksToBounds = YES;
//        resetBtn.layer.borderWidth = 1;
//        resetBtn.layer.borderColor = RGB(63, 199, 193).CGColor;
//        [_bgView addSubview:resetBtn];
//
//
//
//        UIButton *sureBtn = [UIButton createTypeTwoBtnFrame:CGRectMake(CGRectGetMaxX(resetBtn.frame)+10, _bgView.height-45-SafeAreaBottomHeight , (SCREEN_WIDTH-30)/2, 35) title:@"确定" bgImageName:@"d" titleColor:[UIColor whiteColor] bgColor:JISECOLOR titleLabelFont:20 action:^(UIButton *button) {
//
//            isSeletSureBtn = YES;
//
//            [weakSelf sureBtnClick];
//
//            [_dataSeletMarr removeAllObjects];
//            [_dataSeletMarr addObjectsFromArray:_dataSeletMarrNoSureBtn];
//
//            //移除选中的数据
//            [_dataSeletMarrNoSureBtn removeAllObjects];
//
//            isSelectContent = !isSelectContent;
//            if (isSelectContent) {
//                [_selectContentBtn setImage:[[UIImage imageNamed:@"shaiSLight"] originalImage] forState:0];
//                [_selectContentBtn setTitleColor:JISECOLOR forState:0];
//
//
//            }else{
//                if (_dataSeletMarr.count>0) {
//
//                    [_selectContentBtn setImage:[[UIImage imageNamed:@"shaiSLight"] originalImage] forState:0];
//                    [_selectContentBtn setTitleColor:JISECOLOR forState:0];
//
//                }else{
//
//                    [_selectContentBtn setImage:[[UIImage imageNamed:@"shaiSMoren"] originalImage] forState:0];
//                    [_selectContentBtn setTitleColor:[UIColor lightGrayColor] forState:0];
//
//                }
//
//
//            }
//
//            NSMutableArray *arrTags = [NSMutableArray array];
//            if (_dataSeletMarr.count >0) {
//                for (int i=0; i<_dataSeletMarr.count; i++) {
//                    NSInteger indesx = [[_dataSeletMarr objectAtIndex:i] integerValue];
//                    [arrTags addObject:[[_tagsMarr objectAtIndex:indesx] objectForKey:@"NAME"]];
//                }
//
//            }
//            _signsStr = [arrTags componentsJoinedByString:@","];
////            [_GardenPlotArray removeAllObjects];
////            number=1;
////            tempPage = 1;
////            [weakSelf hotAndNewAndSignRequest];
//
//
//        }];
//        sureBtn.layer.cornerRadius = 5;
//        sureBtn.layer.masksToBounds = YES;
//        [_bgView addSubview:sureBtn];
//
//
//    }
//    return _bgView;
//}



@end
