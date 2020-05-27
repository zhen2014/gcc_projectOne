//
//  GanJiaYuanVC.m
//  Patient
//
//  Created by gzz on 16/10/14.
//  Copyright © 2016年 ShangYu. All rights reserved.
//

#import "GanJiaYuanVC.h"
#import "SDPhotoBrowser.h"
#import "NewTopicVC.h"
#import "VaritySignTopicVC.h"
#import "NewtopicDetailVC.h"
#import "AboutGandanController.h"

//gzz180612为筛选准备
#import "TTGTagCollectionView.h"
#import "TTGTextTagCollectionView.h"

@interface GanJiaYuanVC ()
<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,SDPhotoBrowserDelegate,TTGTextTagCollectionViewDelegate>
{
    NSInteger number;
    UIButton *leftButton;//话题按钮
    UIButton *rightButton;//我的话题按钮
    //    UIButton *selectButton;//筛选话题按钮
    
    
    NSInteger currentIntger;
    NSMutableArray *imageArrM;
    BOOL isLeft;// 以后的话  0 话题；  1 我的话题；  2  筛选
    NSInteger pageRightnum;
    NSInteger pageLeftnum;
    
    BOOL isOneSign;
    BOOL twoOneSign;
    BOOL threeOneSign;
    UIImageView *imagershuju;
    UILabel *tiwuxianLab;
    
    UIImageView *imageViewtopic;
    UILabel *onetagLabel;
    UILabel *twotagLabel;
    UILabel *threetagLabel;
    
    NSString *numComment;//评论数目
    NSString *topicUuid; //uuid
    NSString *timeChuo;//时间戳
    
    
#pragma mark 筛选gzz180612
    BOOL isSelectContent;//是否选中筛选按钮
    BOOL isSeletSureBtn;//是否点击了确定按钮
    
    
}
@property(nonatomic,strong)UITableView *GandanTableview;
@property(nonatomic,strong)NSMutableArray *arrM;
@property(nonatomic,strong)NSMutableArray *leftArrM;//话题
@property(nonatomic,strong)NSMutableArray *rightArrM;//我的话题


@property(nonatomic,strong)NSMutableArray *selectArrM;//筛选数组
/*筛选按钮*/
@property (nonatomic, strong) UIButton *selectContentBtn;
/*标签*/
@property (strong, nonatomic)  TTGTextTagCollectionView *textTagCollectionView1;
/*盛放标签的数组*/
@property (nonatomic, strong) NSMutableArray *tagsMarr;
/*盛放选中数据 点击确定键都放入里面*/
@property (nonatomic, strong) NSMutableArray *dataSeletMarr;
/*盛放选中数据 有没有点击确定键都放入里面*/
@property (nonatomic, strong) NSMutableArray *dataSeletMarrNoSureBtn;
/*出现隐藏标签的bool*/
@property (nonatomic, assign) BOOL isHidden;
@property(nonatomic,strong)UIView *bgView;
/*标签的内容 */
@property (nonatomic, copy) NSString *signsStr;


@end

@implementation GanJiaYuanVC

//懒加载
- (NSMutableArray *)selectArrM{
    if (!_selectArrM) {
        _selectArrM = [NSMutableArray array];
    }
    return _selectArrM;
}
//懒加载
- (NSMutableArray *)tagsMarr{
    if (!_tagsMarr) {
        _tagsMarr = [NSMutableArray array];
    }
    return _tagsMarr;
}
//懒加载
- (NSMutableArray *)dataSeletMarr{
    if (!_dataSeletMarr) {
        _dataSeletMarr = [NSMutableArray array];
    }
    return _dataSeletMarr;
}
//懒加载
- (NSMutableArray *)dataSeletMarrNoSureBtn{
    if (!_dataSeletMarrNoSureBtn) {
        _dataSeletMarrNoSureBtn = [NSMutableArray array];
    }
    return _dataSeletMarrNoSureBtn;
}


#pragma mark 标签出来的界面
- (void)tagsUI{
    
    if (_isHidden) {
        _isHidden = NO;
        _bgView = [UIView createViewWithFrame:CGRectMake(0, kTopHeight+55, SCREEN_WIDTH, SCREEN_HEIGHT-55-kTopHeight-49-SafeAreaBottomHeight) bgColor:[UIColor whiteColor]];//[
        [self.view addSubview:_bgView];
        
        
        _textTagCollectionView1 = [[TTGTextTagCollectionView alloc]init];
        [_bgView addSubview:_textTagCollectionView1];
        _textTagCollectionView1.selectionLimit = 1;//限制个数
        _textTagCollectionView1.frame = CGRectMake(10, 20, self.view.frame.size.width-20, SCREEN_HEIGHT-55-kTopHeight-49-SafeAreaBottomHeight-20);
        _textTagCollectionView1.backgroundColor = [UIColor whiteColor];
        
        
        _textTagCollectionView1.delegate = self;
        _textTagCollectionView1.showsVerticalScrollIndicator = NO;
        TTGTextTagConfig *config = _textTagCollectionView1.defaultConfig;
        config.tagTextFont = [UIFont boldSystemFontOfSize:12.0f];
        //文本的颜色
        config.tagTextColor = QIANBLACKCOLOR;
        //选中的样色
        config.tagSelectedTextColor = JISECOLOR;
        
        config.tagBackgroundColor = [UIColor clearColor];
        config.tagSelectedBackgroundColor = [UIColor clearColor];
        
        //水平竖直间距
        if (SCREEN_WIDTH == 320) {
            
            _textTagCollectionView1.horizontalSpacing = 12.0;
            _textTagCollectionView1.verticalSpacing = 12.0;
        }else if (SCREEN_WIDTH == 375 ){
            
            _textTagCollectionView1.horizontalSpacing = 23.0;
            _textTagCollectionView1.verticalSpacing = 15.0;
        }else if (SCREEN_WIDTH == 414 ){
            
            _textTagCollectionView1.horizontalSpacing = 30.0;
            _textTagCollectionView1.verticalSpacing = 20.0;
        }else{
            //iPhone
            
        }
        
        
        //外围包裹
        config.tagBorderColor = QIANBLACKCOLOR;
        config.tagSelectedBorderColor = JISECOLOR;
        config.tagBorderWidth = 1;
        config.tagSelectedBorderWidth = 1;
        
        //阴影
        config.tagShadowColor = [UIColor whiteColor];
        config.tagShadowOffset = CGSizeMake(0, 0);
        config.tagShadowOpacity = 0.0f;
        config.tagShadowRadius = 0.0f;
        
        //裁剪
        config.tagCornerRadius = 10.0;
        config.tagSelectedCornerRadius = 10.0;
        
        //扩展宽高
        config.tagExtraSpace = CGSizeMake(10, 10);
        _textTagCollectionView1.alignment = 0;
        
        //        NSMutableArray *arrTags = [NSMutableArray array];
        //        if (_tagsMarr.count >0) {
        //            for (int i=0; i<_tagsMarr.count; i++) {
        //                [arrTags addObject:[[_tagsMarr objectAtIndex:i] objectForKey:@"NAME"]];
        //            }
        //        }
        NSArray*   arrTags = @[@"等等",@"asdf",@"的第三方",@"的速度",@"额发的",@"巅峰赛但是",@"等等的",@"大的",@"地方",@"大的",@"文身断发",@"手动阀",@"第三方",@"撒地方",@"胡歌"];
        [_textTagCollectionView1 addTags:arrTags];
        
        if (isSeletSureBtn) {
            for (int i = 0; i<self.dataSeletMarr.count; i++) {
                NSUInteger index = [[self.dataSeletMarr objectAtIndex:i] integerValue];
                [_textTagCollectionView1 setTagAtIndex:index selected:YES];
            }
            [self.dataSeletMarrNoSureBtn addObjectsFromArray:self.dataSeletMarr];
        }else{
            isSeletSureBtn = NO;
            
            [self.dataSeletMarr removeAllObjects];
        }
        
        
        [_textTagCollectionView1 reload];
        
        
        
        
        WEAKSELFS
        UIButton *resetBtn = [UIButton createTypeTwoBtnFrame:CGRectMake(10, _bgView.height-45-SafeAreaBottomHeight, (SCREEN_WIDTH-30)/2, 35) title:@"重置" bgImageName:@"d" titleColor:JISECOLOR bgColor:[UIColor whiteColor] titleLabelFont:20 action:^(UIButton *button) {
            
            for (int i = 0; i<self.dataSeletMarrNoSureBtn.count; i++) {
                NSInteger indexs = [self.dataSeletMarrNoSureBtn[i] integerValue];
                [_textTagCollectionView1 setTagAtIndex:indexs selected:NO];
            }
            [self.dataSeletMarrNoSureBtn removeAllObjects];
            [self.dataSeletMarr removeAllObjects];
            
            _signsStr = @"";
            
        }];
        resetBtn.layer.cornerRadius = 5;
        resetBtn.layer.masksToBounds = YES;
        resetBtn.layer.borderWidth = 1;
        resetBtn.layer.borderColor = RGB(63, 199, 193).CGColor;
        [_bgView addSubview:resetBtn];
        
        
        
        UIButton *sureBtn = [UIButton createTypeTwoBtnFrame:CGRectMake(CGRectGetMaxX(resetBtn.frame)+10, _bgView.height-45-SafeAreaBottomHeight , (SCREEN_WIDTH-30)/2, 35) title:@"确定" bgImageName:@"d" titleColor:[UIColor whiteColor] bgColor:JISECOLOR titleLabelFont:20 action:^(UIButton *button) {
            
            isSeletSureBtn = YES;
            
            [weakSelf sureBtnClick];
            
            [self.dataSeletMarr removeAllObjects];
            [self.dataSeletMarr addObjectsFromArray:self.dataSeletMarrNoSureBtn];
            
            //移除选中的数据
            [self.dataSeletMarrNoSureBtn removeAllObjects];
            
            isSelectContent = !isSelectContent;
            if (isSelectContent) {
                [self.selectContentBtn setImage:[[UIImage imageNamed:@"shaiSLight"] originalImage] forState:0];
                [self.selectContentBtn setTitleColor:JISECOLOR forState:0];
                
                
            }else{
                if (self.dataSeletMarr.count>0) {
                    
                    [_selectContentBtn setImage:[[UIImage imageNamed:@"shaiSLight"] originalImage] forState:0];
                    [_selectContentBtn setTitleColor:JISECOLOR forState:0];
                    
                }else{
                    
                    [_selectContentBtn setImage:[[UIImage imageNamed:@"shaiSMoren"] originalImage] forState:0];
                    [_selectContentBtn setTitleColor:[UIColor lightGrayColor] forState:0];
                    
                }
                
                
            }
            
            //            NSMutableArray *arrTags = [NSMutableArray array];
            //            if (self.dataSeletMarr.count >0) {
            //                for (int i=0; i<_dataSeletMarr.count; i++) {
            //                    NSInteger indesx = [[_dataSeletMarr objectAtIndex:i] integerValue];
            //                    [arrTags addObject:[[_tagsMarr objectAtIndex:indesx] objectForKey:@"NAME"]];
            //                }
            //
            //            }
            //            _signsStr = [arrTags componentsJoinedByString:@","];
            //            [_GardenPlotArray removeAllObjects];
            //            number=1;
            //            tempPage = 1;
            //            [weakSelf hotAndNewAndSignRequest];
            
            
        }];
        sureBtn.layer.cornerRadius = 5;
        sureBtn.layer.masksToBounds = YES;
        [_bgView addSubview:sureBtn];
        
        
    }
    
    
    
}




#pragma mark 确定
-(void)sureBtnClick{//gzz0207
    
    [self.view endEditing:YES];
    _isHidden = YES;
    [UIView animateWithDuration:0.25 animations:^{
        _bgView.hidden = YES;
        _bgView.alpha = 0;
    } completion:^(BOOL finished) {
        [_textTagCollectionView1 removeFromSuperview];
        [_bgView removeFromSuperview];
    }];
    
}


#pragma mark - TTGTextTagCollectionViewDelegate

- (void)textTagCollectionView:(TTGTextTagCollectionView *)textTagCollectionView didTapTag:(NSString *)tagText atIndex:(NSUInteger)index selected:(BOOL)selected {
    NSLog(@"%@----所选中的tag-",textTagCollectionView.allSelectedTags);
    
    NSString *tagsindexstr = [NSString stringWithFormat:@"%zd",index];
    
    
    if (selected == 1) {
        
        [self.dataSeletMarrNoSureBtn addObject:tagsindexstr];
        
    }else {
        for (int i =0 ; i<self.dataSeletMarrNoSureBtn.count; i++) {
            if ([[self.dataSeletMarrNoSureBtn objectAtIndex:i] isEqualToString:tagsindexstr]) {
                [self.dataSeletMarrNoSureBtn removeObjectAtIndex:i];
            }
        }
    }
    
    
    //    NSLog(@"---盛放的数据-%@-",_dataSeletMarr);
}





#pragma mark selectContentClick筛选
- (void)selectContentClick{
    //移除选中的数据
    [self.dataSeletMarrNoSureBtn removeAllObjects];
    
    isSelectContent = !isSelectContent;
    if (isSelectContent) {
        //        [_selectContentBtn setImage:[[UIImage imageNamed:@"shaiSLight"] originalImage] forState:0];
        [self.selectContentBtn setTitleColor:JISECOLOR forState:0];
        [self tagsUI];
        
    }else{
        
        if (self.dataSeletMarr.count>0 && isSeletSureBtn) {
            //            [_selectContentBtn setImage:[[UIImage imageNamed:@"shaiSLight"] originalImage] forState:0];
            [_selectContentBtn setTitleColor:JISECOLOR forState:0];
        }else{
            //            [_selectContentBtn setImage:[[UIImage imageNamed:@"shaiSMoren"] originalImage] forState:0];
            [self.selectContentBtn setTitleColor:[UIColor lightGrayColor] forState:0];
        }
        
        _isHidden = YES;
        [UIView animateWithDuration:0.25 animations:^{
            _bgView.hidden = YES;
            _bgView.alpha = 0;
        } completion:^(BOOL finished) {
            [_textTagCollectionView1 removeFromSuperview];
            [_bgView removeFromSuperview];
        }];
    }
    
}


//、、end

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    //如果发布新话题 都要刷新的
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *homePublish = [NSString stringWithFormat:@"%@",[def objectForKey:@"homeTopics"]];
    
    if ([homePublish isEqualToString:@"publicYes"]) {
        
        pageLeftnum = 1;
        isOneSign = NO;
        twoOneSign = NO;
        threeOneSign = NO;
        [_leftArrM  removeAllObjects];
        [self leftTvRequest];
        
        
    }
    
    
    if ([homePublish isEqualToString:@"publicYes"]) {
        
        pageRightnum = 1;
        isOneSign = NO;
        twoOneSign = NO;
        threeOneSign = NO;
        [_rightArrM  removeAllObjects];
        [self rightTvRequest];
        [def setObject:@"publicNo" forKey:@"homeTopics"];
        
    }
    
    
    [_GandanTableview reloadData];//重新刷新数据让其 时间戳比较
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"肝胆家园";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:NavTitleFont],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self navBargandanJiayuan];
    [self dataOpenJiayuan];
    [self makeUIJiayuan];
    
    
    
    pageLeftnum = 1;
    pageRightnum = 1;
    isOneSign = NO;
    twoOneSign = NO;
    threeOneSign = NO;
    _leftArrM = [NSMutableArray array];
    [self leftTvRequest];
    
    
    pageLeftnum = 1;
    pageRightnum = 1;
    isOneSign = NO;
    twoOneSign = NO;
    threeOneSign = NO;
    _rightArrM = [NSMutableArray array];
    [self rightTvRequest];
    //    }
    
    imagershuju=[[UIImageView alloc]init];
    imagershuju.frame = CGRectMake(SCREEN_WIDTH/2-ImagerWuWidth/2, SCREEN_HEIGHT/2-ImagerWuheight/2, ImagerWuWidth, ImagerWuheight);
    imagershuju.image = [UIImage imageNamed:@"zanwushuju2"];
    imagershuju.hidden = YES;
    [self.view addSubview:imagershuju];
    
    
    tiwuxianLab = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-200/2, CGRectGetMaxY(imagershuju.frame), 200, 30)];
    tiwuxianLab.text = @"暂无肝胆家园话题";
    tiwuxianLab.textAlignment = YES;
    tiwuxianLab.textColor = RGB(188, 188, 188);
    tiwuxianLab.hidden = YES;
    tiwuxianLab.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:tiwuxianLab];
    
    [self DownrefreshJiayuan];
    [self headrefreshJiayuan];
    
    
}

//下拉刷新
- (void)DownrefreshJiayuan
{
    
    __weak GanJiaYuanVC *puad = self;
    [puad.GandanTableview addHeaderWithCallback:^{
        
        if (isLeft) {
            [puad.leftArrM removeAllObjects];
            pageLeftnum = 1;
            [puad leftTvRequest];
            [puad.GandanTableview headerEndRefreshing];
            
        }else{
            
            [puad.rightArrM removeAllObjects];
            pageRightnum = 1;
            [puad rightTvRequest];
            [puad.GandanTableview headerEndRefreshing];
        }
    }];
    
}

//上拉加载
- (void)headrefreshJiayuan
{
    __weak GanJiaYuanVC *pudb = self;
    [pudb.GandanTableview addFooterWithCallback:^{
        
        if (isLeft) {
            pageLeftnum ++;
            [pudb leftTvRequest];
            [pudb.GandanTableview footerEndRefreshing];
            
        }else{
            pageRightnum ++;
            [pudb rightTvRequest];
            [pudb.GandanTableview footerEndRefreshing];
        }
        
    }];
    
}

#pragma mark 数据
-(void)dataOpenJiayuan{
    isLeft = YES;
    pageLeftnum = 1;
    pageRightnum = 1;
    isOneSign = NO;
    twoOneSign = NO;
    threeOneSign = NO;
    _arrM = [NSMutableArray array];
    imageArrM = [NSMutableArray array];
    
    _leftArrM = [NSMutableArray array];
    _rightArrM = [NSMutableArray array];
    
    
    //gzz180612
    _signsStr = @"";
    //    number=1;
    //    tempPage = 1;
    //    isNew = YES;
    isSelectContent = NO;
    _isHidden = YES;
    isSeletSureBtn = NO;
    
    
    
}

#pragma mark 界面布局
-(void)makeUIJiayuan{
    NSArray * titArr =@[@"话题",@"我的话题",@"筛选"];
    UIView * bottomVIew =[[UIView alloc]initWithFrame:CGRectMake(0, kTopHeight, SCREEN_WIDTH, 44)];
    
    [self.view addSubview:bottomVIew];
    
    
    for (int i = 0; i< titArr.count; i++) {
        UIButton * bottomBtn =[UIButton buttonWithType:0];
        //        bottomBtn.frame =CGRectMake((SCREEN_WIDTH/2 +1)*i , 1, SCREEN_WIDTH/2 - i*1, 43);
        bottomBtn.frame =CGRectMake((SCREEN_WIDTH/3)*i , 0, SCREEN_WIDTH/3, 44);
        
        [bottomBtn setTitle: titArr[i] forState:UIControlStateNormal];
        [bottomBtn addTarget:self action:@selector(bottomActionJiayuan:) forControlEvents:UIControlEventTouchUpInside];
        bottomBtn.tag = 10107+i;
        [bottomBtn setBackgroundColor:[UIColor whiteColor]];
        [bottomBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        if (bottomBtn.tag == 10107) {
            leftButton = bottomBtn;
            [bottomBtn  setTitleColor:JISECOLOR forState:UIControlStateNormal];
            
        }else if(bottomBtn.tag == 10108){
            rightButton = bottomBtn;
        }else if(bottomBtn.tag == 10109){
            _selectContentBtn = bottomBtn;
        }
        [bottomVIew addSubview:bottomBtn];
        
    }
    
    //    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-0.5, 0, 1.5,44)];
    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3, 0, 1.5,44)];
    
    line1.backgroundColor = RGB(230, 230, 230);
    [bottomVIew addSubview:line1];
    
    UIView *line2 = [UIView createViewWithFrame:CGRectMake(SCREEN_WIDTH/3*2, 0, 1.5, 44) bgColor:RGB(230, 230, 230)];
    [bottomVIew addSubview:line2];
    
    UIView *hengLine1 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(bottomVIew.frame), SCREEN_WIDTH, 10)];
    hengLine1.backgroundColor = RGB(228, 228, 228);
    [self.view addSubview:hengLine1];
    
    
    //gzz180612
    //    _GandanTableview =[[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(hengLine1.frame), SCREEN_WIDTH, SCREEN_HEIGHT-CGRectGetMaxY(hengLine1.frame)-49) style:UITableViewStylePlain];
    //    _GandanTableview.dataSource= self;
    //    _GandanTableview.delegate  = self;
    //    _GandanTableview.backgroundColor = bgLineColor;//[UIColor lightGrayColor];
    //    _GandanTableview.showsVerticalScrollIndicator = YES;
    //    _GandanTableview.tableFooterView  =[[UIView alloc]init];
    //    [self.view addSubview:_GandanTableview];
    
    
    if ([_allSearchValueStr isEqualToString:@"<null>"] ||  [_allSearchValueStr isEqualToString:@"null"] || [_allSearchValueStr isEqualToString:@"(null)"] || _allSearchValueStr.length <= 0) {
        //从搜索过来的 49 隐藏
        _GandanTableview =[[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(hengLine1.frame), SCREEN_WIDTH, SCREEN_HEIGHT-CGRectGetMaxY(hengLine1.frame)-49) style:UITableViewStylePlain];
        _GandanTableview.dataSource= self;
        _GandanTableview.delegate  = self;
        _GandanTableview.backgroundColor = bgLineColor;//[UIColor lightGrayColor];
        _GandanTableview.showsVerticalScrollIndicator = YES;
        _GandanTableview.tableFooterView  =[[UIView alloc]init];
        [self.view addSubview:_GandanTableview];
        
    }else{
        
        _GandanTableview =[[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(hengLine1.frame), SCREEN_WIDTH, SCREEN_HEIGHT-CGRectGetMaxY(hengLine1.frame)) style:UITableViewStylePlain];
        _GandanTableview.dataSource= self;
        _GandanTableview.delegate  = self;
        _GandanTableview.backgroundColor = bgLineColor;//[UIColor lightGrayColor];
        _GandanTableview.showsVerticalScrollIndicator = YES;
        _GandanTableview.tableFooterView  =[[UIView alloc]init];
        [self.view addSubview:_GandanTableview];
        
    }
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-97 ,SCREEN_HEIGHT-130, 97 , 40)] ;
    [self.view addSubview:btn];
    [btn setBackgroundImage:[UIImage imageNamed:@"normalQue"] forState:0];
    [btn addTarget:self action:@selector(playtClickP) forControlEvents:UIControlEventTouchUpInside];
    
    
}

#pragma mark  常见问题---按钮点击事件
- (void)playtClickP{
    //    [self showHint:@"常见问题"];
    AboutGandanController * vc = [[AboutGandanController alloc]init];
    vc.fromWhat = @"mianyi";//展示详情
    vc.htmlPath = @"http://wx.igandan.com/QaA/toindex?share=1";
    vc.title = @"常见问题";
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark 两个按钮的点击切换
-(void)bottomActionJiayuan:(UIButton *)btn {
    if (btn.tag == 10107) {
        isLeft = YES;
        //        pageLeftnum = 1;
        [btn setTitleColor:JISECOLOR forState:UIControlStateNormal];
        [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //        _leftArrM = [NSMutableArray array];
        //        [self leftTvRequest];
        
        
        [self.GandanTableview reloadData];//要刷新数据的
        
        if (_leftArrM.count>0) {
            tiwuxianLab.hidden = YES;
            imagershuju.hidden = YES;
        }else{
            tiwuxianLab.text = @"暂无肝胆家园话题";
            tiwuxianLab.hidden = NO;
            imagershuju.hidden = NO;
        }
        
        
    }else if(btn.tag == 10108){
        
        isLeft = NO;
        //        pageRightnum = 1;
        [btn setTitleColor:JISECOLOR forState:UIControlStateNormal];
        [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        //        _rightArrM = [NSMutableArray array];
        //        [self rightTvRequest];//gzz0630
        
        
        [self.GandanTableview reloadData];// 开始时没有数据的  可以保存一份 如果需要的话
        
        if (_rightArrM.count>0) {
            tiwuxianLab.hidden = YES;
            imagershuju.hidden = YES;
        }else{
            imagershuju.hidden = NO;
            tiwuxianLab.hidden = NO;
            tiwuxianLab.text = @"您暂无发布肝胆家园话题";
        }
        
        
        
    }else if(btn.tag == 10109){
        
        [self selectContentClick];
    }
    
}


#pragma mark  tableviwe start
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (isLeft) {
        if (_leftArrM.count>0) {
            
            //内容
            NSString *contentStr = [NSString stringWithFormat:@"%@",[[_leftArrM objectAtIndex:indexPath.row] objectForKey:@"content"]];
            CGSize sizee;
            if (contentStr.length==0 ||[contentStr isEqualToString:@"<null>"] || [contentStr isEqualToString:@"(null)"]) {
                sizee = CGSizeMake(0, 0);
            }else{
                sizee = [DicRemove checTheStringWithHight:contentStr font:14.0 float:40.0];
                if (sizee.height > 80) {
                    sizee = CGSizeMake(SCREEN_WIDTH-80, 85);//可能会改动gzz1020
                }
                
            }
            
            
            
            CGFloat imgHeigt = 0.0;
            CGFloat signHeight = 0.0;
            
            //图片的有无
            if ([[[_leftArrM objectAtIndex:indexPath.row] objectForKey:@"photo"] count]>0) {
                imgHeigt = 70+10;
            }
            
            signHeight = 20+10;
            //             return 10+50+sizee.height-4+imgHeigt+signHeight+10+10;
            return 10+50+sizee.height-4+imgHeigt+signHeight+10+10-2;//gzz1025
            
            
        }else{
            return  0;
        }
    }else{
        if (_rightArrM.count>0) {
            
            //内容
            NSString *contentStr = [NSString stringWithFormat:@"%@",[[_rightArrM objectAtIndex:indexPath.row] objectForKey:@"content"]];
            CGSize sizee;
            if (contentStr.length==0 ||[contentStr isEqualToString:@"<null>"] || [contentStr isEqualToString:@"(null)"]) {
                sizee = CGSizeMake(0, 0);
            }else{
                sizee = [DicRemove checTheStringWithHight:contentStr font:14.0 float:40.0];
                if (sizee.height > 80) {
                    sizee = CGSizeMake(SCREEN_WIDTH-80, 85);//可能会改动gzz1020
                }
                
            }
            
            
            
            CGFloat imgHeigt = 0.0;
            CGFloat signHeight = 0.0;
            
            //图片的有无
            if ([[[_rightArrM objectAtIndex:indexPath.row] objectForKey:@"photo"] count]>0) {
                imgHeigt = 70+10;
            }
            
            
            signHeight = 20+10;
            return 10+50+sizee.height-4+imgHeigt+signHeight+10+10-2;
            
            
        }else{
            return  0;
        }
        
    }
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (isLeft) {
        return _leftArrM.count;
    }
    else{
        return _rightArrM.count;
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *strint = @"cellGandanJiayuan";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strint];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strint];
        
    }else{//gzz170407
        for (UIView *view in cell.contentView.subviews) {
            [view removeFromSuperview];
        }
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.backgroundColor = RGB(228, 228, 228);//239
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (isLeft) {
        if (_leftArrM.count>0) {
            
            [cell.contentView addSubview:[self addView11:indexPath.row]];
        }
        
        return cell;
    }
    
    
    else{
        if (_rightArrM.count>0) {
            
            [cell.contentView addSubview:[self addView11:indexPath.row]];
        }
        
        return cell;
    }
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *cellDic = [NSDictionary dictionary];
    if (isLeft) {
        cellDic  = [DicRemove clearErrorData11a:[_leftArrM objectAtIndex:indexPath.row]];
        if (_leftArrM.count>0) {
            NewtopicDetailVC *jiaDic = [NewtopicDetailVC new];
            jiaDic.hidesBottomBarWhenPushed = YES;
            jiaDic.JiaDicUUid = [cellDic objectForKey:@"uuid"];
            __weak __typeof(self) weakSelf = self;//gzz1130
            jiaDic.comeInStr = @"topic";
            [jiaDic returncommentNums:^(NSMutableDictionary *commentNumDic) {
                
                topicUuid =  [NSString stringWithFormat:@"%@",commentNumDic[@"topicUuid"]];
                numComment = [NSString stringWithFormat:@"%@",commentNumDic[@"nums"]];
                //评论数目
                
                timeChuo = [NSString stringWithFormat:@"%@",commentNumDic[@"timeInterval"]];//时间戳
                [weakSelf.GandanTableview reloadData];
            }];
            
            [self.navigationController pushViewController:jiaDic animated:YES];
            
        }
    }else{
        cellDic  = [DicRemove clearErrorData11a:[_rightArrM objectAtIndex:indexPath.row]];
        if (_rightArrM.count>0) {
            NewtopicDetailVC *jiaDic = [NewtopicDetailVC new];
            jiaDic.hidesBottomBarWhenPushed = YES;
            jiaDic.comeInStr = @"mytopic";
            __weak __typeof(self) weakSelf = self;//gzz1130
            
            jiaDic.JiaDicUUid = [cellDic objectForKey:@"uuid"];
            [jiaDic returncommentNums:^(NSMutableDictionary *commentNumDic) {
                
                topicUuid =  [NSString stringWithFormat:@"%@",commentNumDic[@"topicUuid"]];
                numComment = [NSString stringWithFormat:@"%@",commentNumDic[@"nums"]];
                //评论数目
                
                timeChuo = [NSString stringWithFormat:@"%@",commentNumDic[@"timeInterval"]];//时间戳
                [weakSelf.GandanTableview reloadData];
            }];
            [self.navigationController pushViewController:jiaDic animated:YES];
            
        }
    }
    
    
}



#pragma mark 自定义cell 过去式
-(UIView *)addView11:(NSInteger)indexx{
    UIView *vieww =[[UIView alloc]init];
    vieww.frame = CGRectMake(0, 0, SCREEN_WIDTH, 90);
    vieww.backgroundColor = [UIColor  whiteColor];//;[UIColor yellowColor];
    
    NSDictionary *cellDic = [NSDictionary dictionary];
    NSMutableDictionary *dicc ;//gzz170329
    if (isLeft) {
        cellDic  = [DicRemove clearErrorData11a:[_leftArrM objectAtIndex:indexx]];
        dicc =  [NSMutableDictionary dictionaryWithDictionary:cellDic];
        //gzz170329
    }else{
        cellDic  = [DicRemove clearErrorData11a:[_rightArrM objectAtIndex:indexx]];
        dicc =  [NSMutableDictionary dictionaryWithDictionary:cellDic];
        //gzz170329
    }
    
    //头像
    NSString  *imgesss;
    NSString  *imagename;
    UIImageView *imageViiew=[[UIImageView alloc]initWithFrame:CGRectMake(10,10,50,50)];
    //    imageViiew.layer.cornerRadius = 25;
    //    imageViiew.layer.masksToBounds = YES;
    [vieww addSubview:imageViiew];
    
    imgesss = [NSString stringWithFormat:@"%@",[cellDic objectForKey:@"patient_photo"]];
    imagename =[NSString stringWithFormat:@"%@%@",ImageUrl,imgesss];
    //        [imageViiew sd_setImageWithURL:[NSURL URLWithString:imagename] placeholderImage:[UIImage imageNamed:@"patientMoren"]];
    [imageViiew setHeader:imagename];
    //
    //姓名
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageViiew.frame)+10, 15, SCREEN_WIDTH-70-10, 18)];
    [vieww addSubview:nameLabel];
    nameLabel.font = [UIFont systemFontOfSize:16];
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.centerY = imageViiew.centerY;
    nameLabel.textColor =[UIColor blackColor];
    nameLabel.backgroundColor = [UIColor  clearColor];//bgLineColor;
    
    
    nameLabel.text = [NSString stringWithFormat:@"%@",[cellDic objectForKey:@"patient_name"]];
    
    //时间 最新留言时间
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-130, 15, 120, 14)];
    [vieww addSubview:timeLabel];
    timeLabel.font = [UIFont systemFontOfSize:12];
    timeLabel.textAlignment = NSTextAlignmentRight;
    timeLabel.centerY = imageViiew.centerY;
    timeLabel.textColor = RGB(102, 102, 102);//[UIColor lightGrayColor];
    
    NSString *dateStr ;
    dateStr = [cellDic objectForKey:@"time"];
    timeLabel.text  = dateStr;
    
    //话题内容
    UILabel* commentLabel = [[UILabel alloc] initWithFrame: CGRectMake(CGRectGetMaxX(imageViiew.frame)+10,CGRectGetMaxY(nameLabel.frame)+8,SCREEN_WIDTH-10-10-10-50, 2)];
    [vieww addSubview:commentLabel];//gzz1025
    commentLabel.numberOfLines = 0;
    commentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    NSString *contentStr ;
    
    contentStr =[NSString stringWithFormat:@"%@",[cellDic objectForKey:@"content"]] ;
    
    commentLabel.text = contentStr;
    
    CGSize size ;
    
    if (contentStr.length==0 ||[contentStr isEqualToString:@"<null>"] || [contentStr isEqualToString:@"<null>"]) {
        size = CGSizeMake(0, 0);
    }else{
        size = [commentLabel sizeThatFits:CGSizeMake(commentLabel.frame.size.width, MAXFLOAT)];
        if (size.height > 80) {
            size = CGSizeMake(SCREEN_WIDTH-80, 70);
            commentLabel.numberOfLines = 5;
        }
        commentLabel.frame =CGRectMake(commentLabel.x,commentLabel.y,commentLabel.width,size.height);
        commentLabel.font = [UIFont systemFontOfSize:14];
        commentLabel.textColor= RGB(102, 102, 102);//[UIColor lightGrayColor];
        [commentLabel sizeToFit];
    }
    commentLabel.backgroundColor = [UIColor  clearColor];//bgLineColor;
    
    
    
    //话题图片
    NSMutableArray *imageArr = [NSMutableArray array];
    
    imageArr = [cellDic objectForKey:@"photo"];
    
    NSInteger totalCount = imageArr.count;
    CGFloat imageWH = 70;
    CGFloat imageY = CGRectGetMaxY(commentLabel.frame)+10;
    vieww.tag = 80015+indexx;//gzz0815 父控件的tag值
    if (imageArr.count>0) {
        for (int i = 0; i < totalCount; i++) {
            UIImageView *ganImageView = [[UIImageView alloc] init];
            [vieww addSubview:ganImageView];
            ganImageView.contentMode = UIViewContentModeScaleAspectFill;
            ganImageView.clipsToBounds = YES;
            ganImageView.userInteractionEnabled = YES;
            ganImageView.contentMode = UIViewContentModeScaleAspectFill;
            ganImageView.tag = 80015*indexx+5376*(i+1);
            CGFloat imageX = i * (imageWH+10) + CGRectGetMaxX(imageViiew.frame)+10;
            ganImageView.frame = CGRectMake(imageX, imageY, 70, 70);
            NSString  *imgesss=[NSString stringWithFormat:@"%@",imageArr[i]];
            NSString  *imagename=[NSString stringWithFormat:@"%@%@",ImageUrl,imgesss];
            [ganImageView sd_setImageWithURL:[NSURL URLWithString:imagename] placeholderImage:[UIImage imageNamed:@"jiayuanMoren_1"]];
            
            if (i == 0) {
                imageViewtopic = ganImageView;
            }
            
            UITapGestureRecognizer  * tap11 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageTapCase:)];
            [ganImageView addGestureRecognizer:tap11];
        }
        
    }
    
    
    NSString *tag1;
    NSString *tag2;
    NSString *tag3;
    
    NSString *tagstrr = [NSString stringWithFormat:@"%@",[cellDic objectForKey:@"tags"]];
    if (tagstrr.length>0&&![tagstrr isEqualToString:@""]) {
        NSArray * arrayq = [tagstrr componentsSeparatedByString:@","];
        if (arrayq.count == 1) {
            tag1 = arrayq[0];
        }else if(arrayq.count ==2){
            tag1 = arrayq[0];
            tag2 = arrayq[1];
        }else {
            tag1 = arrayq[0];
            tag2 = arrayq[1];
            tag3 = arrayq[2];
            
        }
    }
    
    
    CGFloat signHeight = 0.0;
    isOneSign = NO;
    twoOneSign = NO;
    threeOneSign = NO;
    if (tag1.length>0 && ![tag1 isEqualToString:@"(null)"] && ![tag1 isEqualToString:@"<null>"]) {
        signHeight = 20;
        isOneSign = YES;
    }
    
    if (tag2.length>0 && ![tag2 isEqualToString:@"(null)"] && ![tag2 isEqualToString:@"<null>"]) {
        signHeight = 20;
        twoOneSign = YES;
    }
    if (tag3.length>0 && ![tag3 isEqualToString:@"(null)"] && ![tag3 isEqualToString:@"<null>"]) {
        signHeight = 20;
        threeOneSign = YES;
    }
    
    CGFloat signY ;
    if (imageArr.count>0) {//imageArr.count
        
        signY = CGRectGetMaxY(imageViewtopic.frame)+10;
    }else{
        signY = CGRectGetMaxY(commentLabel.frame)+10;
    }
    UILabel *onelabel = [[UILabel alloc]init];
    onetagLabel = onelabel;
    if (isOneSign) {
        onelabel.frame = CGRectMake(CGRectGetMaxX(imageViiew.frame)+10,signY,tag1.length*14+10+6, 20);
        [vieww addSubview:onelabel];
        onelabel.tag =  10019*indexx+53136*(0+1);
        onelabel.font = [UIFont systemFontOfSize:14];
        onelabel.textColor = JISECOLOR;
        onelabel.layer.borderColor = [[UIColor colorWithRed:63/255.0 green:199/255.0 blue:193/255.0 alpha:1]CGColor];
        onelabel.layer.cornerRadius = 8;
        onelabel.layer.masksToBounds = YES;
        onelabel.layer.borderWidth = 1;
        onelabel.text = tag1;
        onelabel.textAlignment = NSTextAlignmentCenter;
        onelabel.userInteractionEnabled = YES;
        UITapGestureRecognizer  * onelabeTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onelabelTap:)];
        [onelabel addGestureRecognizer:onelabeTap];
    }
    
    
    UILabel *twolabel = [[UILabel alloc]init];
    twotagLabel = twolabel;
    if (twoOneSign) {
        twolabel.frame = CGRectMake(CGRectGetMaxX(onelabel.frame)+10+6,0, tag2.length*14+10, 20);
        twolabel.frame = CGRectMake(CGRectGetMaxX(onelabel.frame)+8,signY,tag2.length*14+10+6, 20);
        [vieww addSubview:twolabel];
        twolabel.tag =  10019*indexx+53136*(1+1);
        twolabel.text = tag2;
        twolabel.font = [UIFont systemFontOfSize:14];
        twolabel.textColor = JISECOLOR;
        twolabel.layer.borderColor = [[UIColor colorWithRed:63/255.0 green:199/255.0 blue:193/255.0 alpha:1]CGColor];
        twolabel.layer.cornerRadius = 8;
        twolabel.layer.masksToBounds = YES;
        twolabel.layer.borderWidth = 1;
        twolabel.textAlignment = NSTextAlignmentCenter;
        
        twolabel.userInteractionEnabled = YES;
        UITapGestureRecognizer  * twolabeTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(twolabelTap:)];
        [twolabel addGestureRecognizer:twolabeTap];
    }
    
    
    UILabel *three = [[UILabel alloc]init];
    threetagLabel = three;
    
    if (threeOneSign) {
        three.frame = CGRectMake(CGRectGetMaxX(twolabel.frame)+8,signY, tag3.length*14+10+6, 20);
        [vieww addSubview:three];
        three.tag =  10019*indexx+53136*(2+1);
        three.font = [UIFont systemFontOfSize:14];
        three.textColor = JISECOLOR;
        three.layer.borderColor = [[UIColor colorWithRed:63/255.0 green:199/255.0 blue:193/255.0 alpha:1]CGColor];
        three.layer.cornerRadius = 8;
        three.layer.masksToBounds = YES;
        three.layer.borderWidth = 1;
        three.text = tag3;
        three.textAlignment = NSTextAlignmentCenter;
        three.userInteractionEnabled = YES;
        UITapGestureRecognizer  * tthreelabeTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(threelabelTap:)];
        [three addGestureRecognizer:tthreelabeTap];
        
    }
    
    //当前留言数 以及图标
    UIView *liulanView = [[UIView alloc]init];
    [vieww addSubview:liulanView];
    liulanView.frame = CGRectMake(SCREEN_WIDTH-100, signY , 90, 20);
    liulanView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *liuImageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 2, 14, 14)];
    liuImageview.image = [UIImage imageNamed:@"liuyanshumu_1"];
    [liulanView addSubview:liuImageview];
    
    UILabel  *liuLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(liuImageview.frame)+5, 1, 15, 12)];
    [liulanView addSubview:liuLabel];
    liuLabel.centerY = liuImageview.centerY;
    liuLabel.textColor = RGB(153, 153, 153);[UIColor lightGrayColor];
    liuLabel.font = SYSTEMFONT(12);
    NSString *liuyanshumu;
    
    liuyanshumu =[NSString stringWithFormat:@"%@",[cellDic objectForKey:@"commentnum"]] ;
    if (liuyanshumu.length == 0 || [liuyanshumu isEqualToString:@""]||[liuyanshumu isEqualToString:@"<null>"]||[liuyanshumu isEqualToString:@"(null)"]) {
        liuyanshumu = @"0";
    }
    
    //gzz170329
    if ([topicUuid isEqualToString:[cellDic objectForKey:@"uuid"]]) {
        NSInteger num = [numComment integerValue];
        
        liuyanshumu = [NSString stringWithFormat:@"%zd",num];
        [dicc setObject:liuyanshumu forKey:@"commentnum"];
        liuyanshumu = [NSString stringWithFormat:@"%@", [dicc objectForKey:@"commentnum"]];
        
        if (isLeft) {
            [_leftArrM replaceObjectAtIndex:indexx withObject:dicc];
            
        }else{
            [_rightArrM replaceObjectAtIndex:indexx withObject:dicc];
            
        }
    }
    
    //从类型传进来但是 home页的也要跟着改变 @"topicUuid nums
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
    dicM = [def objectForKey:@"varitytopic_homeTopic"];
    //timeChuo timeInterval
    if ([topicUuid isEqualToString:dicM[@"topicUuid"]]) {
        double timeHome = [timeChuo doubleValue];
        double typeTime = [dicM[@"timeInterval"] doubleValue];
        if (typeTime>timeHome) {
            if ([dicM[@"topicUuid"] isEqualToString:[cellDic objectForKey:@"uuid"]]) {
                NSInteger num = [dicM[@"nums"] integerValue];
                liuyanshumu = [NSString stringWithFormat:@"%zd",num];
                [dicc setObject:liuyanshumu forKey:@"commentnum"];
                liuyanshumu = [NSString stringWithFormat:@"%@", [dicc objectForKey:@"commentnum"]];
                
                if (isLeft) {
                    [_leftArrM replaceObjectAtIndex:indexx withObject:dicc];
                    
                }else{
                    [_rightArrM replaceObjectAtIndex:indexx withObject:dicc];
                    
                }
            }
            
            
        }else{
            
        }
        
    }else{//不等的时候
        if ([dicM[@"topicUuid"] isEqualToString:[cellDic objectForKey:@"uuid"]]) {
            NSInteger num = [dicM[@"nums"] integerValue];
            liuyanshumu = [NSString stringWithFormat:@"%zd",num];
            [dicc setObject:liuyanshumu forKey:@"commentnum"];
            liuyanshumu = [NSString stringWithFormat:@"%@", [dicc objectForKey:@"commentnum"]];
            
            if (isLeft) {
                [_leftArrM replaceObjectAtIndex:indexx withObject:dicc];
                
            }else{
                [_rightArrM replaceObjectAtIndex:indexx withObject:dicc];
                
            }
        }
        
        
    }
    
    liuLabel.text = liuyanshumu;
    [liuLabel sizeToFit];
    liuLabel.frame = CGRectMake(CGRectGetMaxX(liuImageview.frame)+5, 1, liuLabel.width, liuLabel.height);
    CGFloat ww = liuImageview.width + liuLabel.width +6;
    liulanView.frame = CGRectMake(SCREEN_WIDTH-ww-10, liulanView.y, ww, liulanView.height);
    vieww.frame = CGRectMake(vieww.x, vieww.y, vieww.width, CGRectGetMaxY(liulanView.frame)+10);
    return vieww;
    
}




#pragma mark  三种标签的点击 begin
-(void)onelabelTap:(UITapGestureRecognizer *)onelabelTap{
    MCLog(@"第一个lable的点击");//    onelabel.tag =  10019*indexx+53136*(0+1);
    NSUInteger Tag = onelabelTap.view.tag;
    UILabel *labeloNe = (UILabel *)[self.view viewWithTag:Tag];
    MCLog(@"one %zd,  value = %@",Tag,labeloNe.text);
    VaritySignTopicVC *var = [VaritySignTopicVC new];
    var.hidesBottomBarWhenPushed = YES;
    var._titleName = [NSString stringWithFormat:@"%@",labeloNe.text];
    [self.navigationController pushViewController:var animated:YES];
    
    
}

-(void)twolabelTap:(UITapGestureRecognizer *)twolabelTap{
    MCLog(@"第2个lable的点击");
    NSUInteger Tag = twolabelTap.view.tag;
    UILabel *labeloNe = (UILabel *)[self.view viewWithTag:Tag];
    MCLog(@"2222 %zd,  value = %@",Tag,labeloNe.text);
    VaritySignTopicVC *var = [VaritySignTopicVC new];
    var.hidesBottomBarWhenPushed = YES;
    var._titleName = [NSString stringWithFormat:@"%@",labeloNe.text];
    [self.navigationController pushViewController:var animated:YES];
}

-(void)threelabelTap:(UITapGestureRecognizer *)threelabelTap{
    MCLog(@"第3个lable的点击");
    NSUInteger Tag = threelabelTap.view.tag;
    UILabel *labeloNe = (UILabel *)[self.view viewWithTag:Tag];
    MCLog(@"33333 %zd,  value = %@",Tag,labeloNe.text);
    VaritySignTopicVC *var = [VaritySignTopicVC new];
    var.hidesBottomBarWhenPushed = YES;
    var._titleName = [NSString stringWithFormat:@"%@",labeloNe.text];
    [self.navigationController pushViewController:var animated:YES];
}

#pragma mark  三种标签的点击 end



#pragma mark SDPhotoBrowserDelegate 开始
-(void)imageTapCase:(UITapGestureRecognizer *)ges
{
    SDPhotoBrowser *browser = [[SDPhotoBrowser alloc] init];
    
    
    NSUInteger fatherTag = ges.view.tag/80015+80015;
    UIView *fatherview = (UIView *)[self.view viewWithTag:fatherTag];
    
    browser.sourceImagesContainerView = fatherview; // 原图的父控件
    NSMutableArray *imageArr = [NSMutableArray array];
    if (isLeft) {
        imageArr = [[_leftArrM objectAtIndex:ges.view.tag/80015] objectForKey:@"photo"];//gzz180112
    }else{
        //右边
        imageArr = [[_rightArrM objectAtIndex:ges.view.tag/80015] objectForKey:@"photo"];
        
    }
    currentIntger = ges.view.tag/80015;
    browser.imageCount = imageArr.count; // 图片总数
    NSInteger  jige = ges.view.tag/80015;
    NSInteger  dijige = ges.view.tag - 80015*jige;
    dijige = dijige/5376 -1 ;
    browser.currentImageIndex = dijige;//ges.view.tag;
    browser.delegate = self;
    [browser show];
    
}

// 返回临时占位图片（即原来的小图）
-(UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
    
    UIImageView *imageview = [[UIImageView alloc]init];
    
    NSMutableArray *arrM = [NSMutableArray array];
    if (isLeft) {
        arrM = [[_leftArrM objectAtIndex:currentIntger] objectForKey:@"photo"];
        
    }else{
        
        arrM = [[_rightArrM objectAtIndex:currentIntger] objectForKey:@"photo"];
        
    }
    
    NSString  *imgesss=[NSString stringWithFormat:@"%@",[arrM objectAtIndex:index]];
    NSString  *imagename=[NSString stringWithFormat:@"%@%@",ImageUrl,imgesss];
    [imageview sd_setImageWithURL:[NSURL URLWithString:imagename] placeholderImage:[UIImage imageNamed:@"gandanmoren"]];
    return [imageview image];
    
}

// 返回高质量图片的url
-(NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
{
    
    return nil;
}
#pragma mark SDPhotoBrowserDelegate 结束




#pragma mark 发布新话题按钮设计
-(void)navBargandanJiayuan{
    
    UIButton *back1 = [UIButton buttonWithType:UIButtonTypeCustom];
    back1.frame =CGRectMake(0, 0, 20, 20);
    [back1 addTarget:self action:@selector(writeSomething) forControlEvents:UIControlEventTouchUpInside];
    [back1 setBackgroundImage:[UIImage imageNamed:@"bianjihuati_1"] forState:UIControlStateNormal];
    
    UIBarButtonItem *barItem1 = [[UIBarButtonItem alloc]initWithCustomView:back1];
    self.navigationItem.rightBarButtonItem=barItem1;
}
#pragma mark 发布新话题按钮点击
-(void)writeSomething{
    MCLog(@"发布话题按钮");
    NewTopicVC *newTop = [NewTopicVC new];
    newTop.hidesBottomBarWhenPushed = YES;
    newTop.comeInstr = @"homeTopic";
    [self.navigationController pushViewController:newTop animated:YES];
    
}



#pragma mark 接口
#pragma mark 左边的请求
-(void)leftTvRequest{
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];//gzz0617af
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"text/json",@"application/json", nil];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *Srurl =[NSString stringWithFormat:@"%@ganDanHomeList",Public_URLNew];
    NSMutableDictionary *dicm = [NSMutableDictionary dictionary];
    dicm[@"page"] = [NSString stringWithFormat:@"%zd",pageLeftnum];
    
    [manager POST: Srurl  parameters:dicm progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSString *coder = [NSString stringWithFormat:@"%@",dic[@"code"]];
        NSDictionary *dicc = [dic objectForKey:@"data"];
        if ([coder isEqualToString:@"1"]) {
            
            NSMutableArray * arr = [dicc objectForKey:@"list"];
            if (arr.count>0) {
                [_leftArrM addObjectsFromArray:arr];
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [_GandanTableview reloadData];
                
            }else{
                
                [_GandanTableview reloadData];
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                
            }
            
        }else{
            [self showHint:[dic  objectForKey:@"message"]];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            
        }
        
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if (isLeft) {
            if (_leftArrM.count>0) {
                imagershuju.hidden = YES;
                tiwuxianLab.hidden = YES;
            }else{
                
                
                imagershuju.hidden = NO;
                tiwuxianLab.hidden = NO;
                tiwuxianLab.text = @"暂无肝胆家园话题";
                
                
            }
            
        }else{
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        if (isLeft) {
            if (_leftArrM.count>0) {
                imagershuju.hidden = YES;
                tiwuxianLab.hidden = YES;
            }else{
                
                
                imagershuju.hidden = NO;
                tiwuxianLab.hidden = NO;
                tiwuxianLab.text = @"暂无肝胆家园话题";
                
                
            }
            
        }else{
            
        }
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
    }];
    
}

#pragma mark 右边的请求
-(void)rightTvRequest{
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];//gzz0617af
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"text/json",@"application/json", nil];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *Srurl =[NSString stringWithFormat:@"%@ganDanHomeListByPatientUuid",Public_URLNew];
    NSMutableDictionary *dicm = [NSMutableDictionary dictionary];
    Dlpontlerexple *dlp = [Dlpontlerexple shareIndence];
    NSString *Uuid =[NSString stringWithFormat:@"%@",dlp.uuidstring];
    dicm[@"page"] = [NSString stringWithFormat:@"%zd",pageRightnum];
    dicm[@"patient_uuid"] = Uuid;
    
    [manager POST: Srurl  parameters:dicm progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSString *coder = [NSString stringWithFormat:@"%@",dic[@"code"]];
        NSDictionary *dicc = [dic objectForKey:@"data"];
        if ([coder isEqualToString:@"1"]) {
            
            NSMutableArray * arr = [dicc objectForKey:@"list"];
            if (arr.count>0) {
                
                [_rightArrM addObjectsFromArray:arr];
                
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                
                [_GandanTableview reloadData];
                
                
            }else{
                
                [_GandanTableview reloadData];
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                
            }
            
        }else{
            [self showHint:[dic  objectForKey:@"message"]];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            
        }
        
        
        if (isLeft) {
            
            
        }else{
            if (_rightArrM.count>0) {
                imagershuju.hidden = YES;
                tiwuxianLab.hidden = YES;
                
            }else{
                
                
                imagershuju.hidden = NO;
                tiwuxianLab.hidden = NO;
                tiwuxianLab.text = @"您暂无发布肝胆家园话题";
                
            }
        }
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        if (_rightArrM.count>0) {
            imagershuju.hidden = YES;
            tiwuxianLab.hidden = YES;
            
        }else{
            imagershuju.hidden = NO;
            tiwuxianLab.hidden = NO;
            tiwuxianLab.text = @"您暂无发布肝胆家园话题";
            
        }
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
    }];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end


