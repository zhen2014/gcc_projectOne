//
//  180611cell.m
//  EveryDayCopy
//
//  Created by gao zhen on 2018/6/11.
//  Copyright © 2018年 gao zhen. All rights reserved.
//

#import "180611cell.h"

@interface _80611cell ()

@end

@implementation _80611cell

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


///*
// //
// //  GanHosFamousDocCell.m
// //  Patient
// //
// //  Created by gao zhen on 2018/6/7.
// //  Copyright © 2018年 ShangYu. All rights reserved.
// //
//
// #import "GanHosFamousDocCell.h"
// //#import "GZxuXianView.h" // 没用到
// @interface GanHosFamousDocCell()
//
// //背景图片
// @property(nonatomic,strong) UIImageView *bgbgImageview;
//
// //医院名字
// @property(nonatomic,strong) UILabel *nameHospitalLab;
//
//
// //竖着的imgag图片
// @property(nonatomic,strong) UIImageView *shusImageview;
//
// //heng的imgag图片
// //@property(nonatomic,strong) UIImageView *horizontalImageview;
//
// //heng的imgag图片
// @property(nonatomic,strong) UILabel *horizontalLabel;
//
//
// /*虚线*/
//@property (nonatomic, strong) UIView *originXuxianView;
//
//
///*虚线的直线测试*/
//@property (nonatomic, strong) UIView *henglienViesws;
//
//
///*科室名称*/
//@property (nonatomic, strong) UILabel *departmentHospitalLab;
//
////advisory 咨询专家头衔
//@property (nonatomic, strong) UILabel *advisoryExpertLab;
//
//
///*小人头*/
//@property (nonatomic, strong) UIImageView *headsImageview;
//
///*小人头 label*/
//@property (nonatomic, strong) UILabel *headslabel;
//
///*爱心图片*/
//@property (nonatomic, strong) UIImageView *lovesImageview;
//
///*爱心 label*/
//@property (nonatomic, strong) UILabel *loveslabel;
//
//
///*头像图片*/
//@property (nonatomic, strong) UIImageView *photoImageview;
//
////advisoryNmae 咨询专家name
//@property (nonatomic, strong) UILabel *advisoryNameLabe;
//
//
////advisoryNmae z主任医师等
//@property (nonatomic, strong) UILabel *titleAdvisoryNameLabe;
//
//
////判断是否是另外一种显示形式
//@property (nonatomic, strong) UILabel *yesOrNoLabel;
//
//
//@end
//
//
//@implementation GanHosFamousDocCell
//
//
//+(instancetype)cellWithTableView:(UITableView *)tableView {
//
//    static NSString *identifiers = @"famousCellDocs";
//    GanHosFamousDocCell *cell = [tableView dequeueReusableCellWithIdentifier:identifiers];
//    if (cell == nil) {
//
//        cell = [[GanHosFamousDocCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifiers];
//    }
//    return cell;
//}
//
//
//-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
//
//    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
//
//    if (self) {
//
//
//
//        UIImageView *bgheadImgesss = [[UIImageView alloc]init];
//        [self.contentView addSubview:bgheadImgesss];
//        _bgbgImageview = bgheadImgesss;
//
//
//
//        //        yesOrNoLabel
//        UILabel *yesOrNoLabelnameL = [[UILabel alloc]init];
//        [_bgbgImageview addSubview:yesOrNoLabelnameL];
//        _yesOrNoLabel = yesOrNoLabelnameL;
//
//
//        UILabel *hospitalnameL = [[UILabel alloc]init];
//        [_bgbgImageview addSubview:hospitalnameL];
//        _nameHospitalLab = hospitalnameL;
//
//
//
//
//        //        UIImageView *hengImge = [[UIImageView alloc]init];
//        //        [_bgbgImageview addSubview:hengImge];
//        //        _horizontalImageview = hengImge;
//
//        //        UILabel *abelnameL = [[UILabel alloc]init];
//        //        [_bgbgImageview addSubview:abelnameL];
//        //        _horizontalLabel = abelnameL;
//
//        //        originXuxianView
//        UIView *viewws = [UIView new];
//        [_bgbgImageview addSubview:viewws];
//        _originXuxianView = viewws;
//
//        //        UIView *henglienVie = [UIView new];
//        //        [_bgbgImageview addSubview:henglienVie];
//        //        _henglienViesws = henglienVie;
//
//        UIImageView *shuImge = [[UIImageView alloc]init];
//        [_bgbgImageview addSubview:shuImge];
//        _shusImageview = shuImge;
//
//        UILabel *rankLab = [[UILabel alloc]init];
//        [_bgbgImageview addSubview:rankLab];
//        _departmentHospitalLab = rankLab;
//
//
//        //        advisoryExpertLab
//        UILabel *zixunLab = [[UILabel alloc]init];
//        [_bgbgImageview addSubview:zixunLab];
//        _advisoryExpertLab = zixunLab;
//
//
//        UIImageView *imaghead = [[UIImageView alloc]init];
//        [_bgbgImageview addSubview:imaghead];
//        _headsImageview = imaghead;
//
//        UILabel *headlabel = [[UILabel alloc]init];
//        [_bgbgImageview addSubview:headlabel];
//        _headslabel = headlabel;
//
//        UIImageView *imaglove = [[UIImageView alloc]init];
//        [_bgbgImageview addSubview:imaglove];
//        _lovesImageview = imaglove;
//
//        UILabel *lovelabel = [[UILabel alloc]init];
//        [_bgbgImageview addSubview:lovelabel];
//        _loveslabel = lovelabel;
//
//
//
//        UIImageView *photoImge = [[UIImageView alloc]init];
//        [_bgbgImageview addSubview:photoImge];
//        _photoImageview = photoImge;
//
//
//        UILabel *adnamereLab = [[UILabel alloc]init];
//        [_bgbgImageview addSubview:adnamereLab];
//        _advisoryNameLabe = adnamereLab;
//
//        //        titleAdvisoryNameLabe
//
//
//        UILabel *titleAdvisoryNameLabel = [[UILabel alloc]init];
//        [_bgbgImageview addSubview:titleAdvisoryNameLabel];
//        _titleAdvisoryNameLabe = titleAdvisoryNameLabel;
//
//
//
//
//
//    }
//
//    return self;
//}
//
///**
// ** lineView:       需要绘制成虚线的view
// ** lineLength:     虚线的宽度
// ** lineSpacing:    虚线的间距
// ** lineColor:      虚线的颜色
// **/
//- (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
//{
//    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//    [shapeLayer setBounds:lineView.bounds];
//    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
//    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
//
//    //  设置虚线颜色为
//    [shapeLayer setStrokeColor:lineColor.CGColor];
//
//    //  设置虚线宽度
//    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
//    [shapeLayer setLineJoin:kCALineJoinRound];
//
//    //  设置线宽，线间距
//    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
//
//    //  设置路径
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathMoveToPoint(path, NULL, 0, 0);
//    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
//
//    [shapeLayer setPath:path];
//    CGPathRelease(path);
//
//    //  把绘制好的虚线添加上来
//    [lineView.layer addSublayer:shapeLayer];
//}
///*
// UIView *dashedView = [[UIView alloc] initWithFrame:CGRectMake(2, 300, self.view.frame.size.width - 4, 1)];
// [self.view addSubview:dashedView];
// [self drawDashLine:dashedView lineLength:4 lineSpacing:1 lineColor:[UIColor yellowColor]];
//
// */
//
//- (void)setDataDic:(NSMutableDictionary *)dataDic{
//
//
//    CGFloat bili = SCREEN_WIDTH/320.0; //10 *bili 10--->bili
//
//    CGFloat zongWidth = SCREEN_WIDTH-bili*2*10.0;
//    CGFloat zongHeight = zongWidth*(280.0/600);
//
//
//    CGFloat leftSpaceWidth = (SCREEN_WIDTH-bili*2*10)/3*2.0;
//    CGFloat rightSpaceWidth = (SCREEN_WIDTH-bili*2*10)/3.0;
//
//
//    //    _yesOrNoLabel.frame = CGRectMake(1, 10, rightSpaceWidth-1,  20);
//    //    _yesOrNoLabel.text = [NSString stringWithFormat:@"%@",dataDic[@"name"]];//@"专家名字";
//    //
//    //    _yesOrNoLabel.textAlignment = NSTextAlignmentCenter;
//    //    _yesOrNoLabel.font = [UIFont systemFontOfSize:12.0];
//    //    [_yesOrNoLabel sizeToFit];
//    //    _yesOrNoLabel.layer.cornerRadius = 10;
//    //    _yesOrNoLabel.layer.masksToBounds = YES;
//    //    _yesOrNoLabel.width = _yesOrNoLabel.width+10;
//    //    _yesOrNoLabel.hidden = YES;
//    //    _yesOrNoLabel.text.length >5;
//    NSString*namelength = [NSString stringWithFormat:@"%@",dataDic[@"name"]];//@"专家名字";
//
//    //aaaaaaaaaaaaaa???????????
//    //    if (_yesOrNoLabel.width>rightSpaceWidth-1) {//另外的一种显示形式 较少的那种
//    //    if (namelength.length>5 ) {//大于五个字就放在左上角
//    if (namelength.length>5 ) {//大于五个字就放在左上角
//
//        //        _advisoryExpertLab.hidden = YES;
//        _advisoryExpertLab.hidden = YES;
//
//        _bgbgImageview.frame =  CGRectMake(bili*10, bili*10, SCREEN_WIDTH-2*bili*10, zongHeight);
//        _bgbgImageview.image = [UIImage imageNamed:@"one"];
//
//        //        for (int i=0; i<_indepaths.row; i++) {
//        int j = _indepaths.row % 5;
//        MCLog(@"jjj=%zd===_indepaths.row==%zd",j,_indepaths.row);
//        switch (j+1) {
//
//            case 1:
//                _bgbgImageview.image = [UIImage imageNamed:@"bgoneYi"];
//
//                break;
//            case 2:
//                _bgbgImageview.image = [UIImage imageNamed:@"bgtwoYi"];
//
//                break;
//            case 3:
//                _bgbgImageview.image = [UIImage imageNamed:@"bgthreeYi"];
//
//                break;
//            case 4:
//                _bgbgImageview.image = [UIImage imageNamed:@"bgfourYi"];
//
//                break;
//            case 5:
//                _bgbgImageview.image = [UIImage imageNamed:@"bgfiveYi"];
//
//                break;
//
//            default:
//                break;
//        }
//        //        }
//
//        MCLog(@"_bgbgImageview=%@",NSStringFromCGRect(_bgbgImageview.frame));
//        _advisoryNameLabe.frame = CGRectMake(10, bili*15, leftSpaceWidth-20,  20);
//        _advisoryNameLabe.text = [NSString stringWithFormat:@"%@",dataDic[@"name"]];//@"专家名字";
//        _advisoryNameLabe.textAlignment = NSTextAlignmentCenter;
//        _advisoryNameLabe.font = [UIFont systemFontOfSize:14.0];
//        [_advisoryNameLabe sizeToFit];
//        //        _advisoryNameLabe.backgroundColor = [UIColor whiteColor];
//        _advisoryNameLabe.textColor = [UIColor whiteColor];
//        if (_advisoryNameLabe.width>leftSpaceWidth-20) {
//            _advisoryNameLabe.font = [UIFont systemFontOfSize:12.0];
//        }
//
//
//
//        _nameHospitalLab.frame = CGRectMake(10,CGRectGetMaxY(_advisoryNameLabe.frame)+bili*9,leftSpaceWidth-20, 40);
//        _nameHospitalLab.text = [NSString stringWithFormat:@"%@",dataDic[@"hospital_name"]];//医院名字_对对对打架啊垃圾家电家具记得记得就额就觉得的对对对";
//        _nameHospitalLab.textAlignment = NSTextAlignmentLeft;
//        _nameHospitalLab.font = [UIFont systemFontOfSize:14.0];
//        _nameHospitalLab.textColor = WHITECOLORS;
//        _nameHospitalLab.numberOfLines = 2;//gzz180427
//        [_nameHospitalLab sizeToFit];
//        MCLog(@"nameHeight===%lf",_nameHospitalLab.height); //33.5
//
//
//        //bili*15+_advisoryNameLabe.width+ 33.5+bili*9
//        _departmentHospitalLab.frame = CGRectMake(10, bili*15+_advisoryNameLabe.height+ 33.5+bili*9*2,  leftSpaceWidth-20,  20);
//
//        _departmentHospitalLab.text = [NSString stringWithFormat:@"%@",dataDic[@"office_name"]];//@"人工肝科室";
//        _departmentHospitalLab.font = [UIFont systemFontOfSize:12.0];
//        [_departmentHospitalLab sizeToFit];
//        _departmentHospitalLab.textColor = [UIColor whiteColor];
//        //        _departmentHospitalLab.backgroundColor = [UIColor blueColor];
//
//        _titleAdvisoryNameLabe.frame = CGRectMake(CGRectGetMaxX(_departmentHospitalLab.frame)+5,1, rightSpaceWidth-1,12);
//        _titleAdvisoryNameLabe.font = [UIFont systemFontOfSize:12.0];
//        _titleAdvisoryNameLabe.text = [NSString stringWithFormat:@"%@",dataDic[@"position_name"]];//@"主任医师";
//        _titleAdvisoryNameLabe.textAlignment = NSTextAlignmentLeft;
//        _titleAdvisoryNameLabe.textColor = [UIColor whiteColor];
//        [_titleAdvisoryNameLabe sizeToFit];
//        _titleAdvisoryNameLabe.centerY = _departmentHospitalLab.centerY;
//        //        _titleAdvisoryNameLabe.backgroundColor = [UIColor redColor];
//
//
//        if(_titleAdvisoryNameLabe.width+_departmentHospitalLab.width>leftSpaceWidth-20) {
//            _titleAdvisoryNameLabe.width = leftSpaceWidth-_departmentHospitalLab.width-25;
//        }
//
//
//        _originXuxianView.frame = CGRectMake(0,CGRectGetMaxY(_departmentHospitalLab.frame)+bili*10,leftSpaceWidth,0.7);
//
//        [self drawDashLine:_originXuxianView lineLength:4 lineSpacing:1 lineColor:[UIColor whiteColor]];
//
//
//
//
//        _shusImageview.frame = CGRectMake(CGRectGetMaxX(_originXuxianView.frame), 0, 1,zongHeight);
//        _shusImageview.backgroundColor = [UIColor whiteColor];
//        _shusImageview.hidden = YES;
//
//
//
//        _headsImageview.frame = CGRectMake(10, CGRectGetMaxY(_originXuxianView.frame)+bili*10, 15*bili, 15*bili);
//        _headsImageview.backgroundColor = [UIColor clearColor];
//        _headsImageview.image = [UIImage imageNamed:@"patientNumHosWhite"];
//
//
//        _headslabel.frame = CGRectMake(CGRectGetMaxX(_headsImageview.frame), 1,rightSpaceWidth-20, 16);
//        _headslabel.text = [NSString stringWithFormat:@"：%@",dataDic[@"apply_num"]]; //consult_num
//        //        _headslabel.text = [NSString stringWithFormat:@"：3501"];
//        _headslabel.textColor = WHITECOLORS;
//        _headslabel.textAlignment = NSTextAlignmentLeft;
//        _headslabel.font = [UIFont systemFontOfSize:12.0];
//
//        _headslabel.centerY = _headsImageview.centerY;
//
//        _lovesImageview.frame = CGRectMake(CGRectGetMaxX(_headslabel.frame)+10, 5, 15*bili, 15*bili);
//        _lovesImageview.backgroundColor = [UIColor clearColor];
//        _lovesImageview.centerY = _headsImageview.centerY;
//        _lovesImageview.image = [UIImage imageNamed:@"ganCounsultNumHosWhite"];
//
//
//
//        _loveslabel.frame = CGRectMake(bili*leftSpaceWidth/2+20, 1,rightSpaceWidth-30, 16);
//        //        _loveslabel.text = [NSString stringWithFormat:@"：13"];
//        _loveslabel.text = [NSString stringWithFormat:@"：%@",dataDic[@"consult_num"]]; //consult_num
//        _loveslabel.textColor = WHITECOLORS;
//        _loveslabel.textAlignment = NSTextAlignmentLeft;
//        _loveslabel.font = [UIFont systemFontOfSize:12.0];
//
//        _loveslabel.centerY = _headsImageview.centerY;
//
//
//
//        _photoImageview.frame = CGRectMake(CGRectGetMaxX(_shusImageview.frame), 0, rightSpaceWidth-1, CGRectGetMaxY(_lovesImageview.frame)+9*bili);
//        //        _photoImageview.backgroundColor = RGB(87 , 188, 224);
//        NSString  *imagename = [NSString stringWithFormat:@"%@%@",ImageUrl,dataDic[@"img"]];
//        [_photoImageview sd_setImageWithURL:[NSURL URLWithString:imagename] placeholderImage:[UIImage imageNamed:@"contentMren"]];
//
//
//        _bgbgImageview.height = CGRectGetMaxY(_lovesImageview.frame)+9*bili;
//
//        _shusImageview.height = CGRectGetMaxY(_lovesImageview.frame)+9*bili;
//        //
//        //        MCLog(@"left=%lf===height=%lf",rightSpaceWidth,_shusImageview.height);
//        //        MCLog(@"left/height=%lf",rightSpaceWidth/_shusImageview.height);
//
//
//    }else{
//        //bbbbbbbbbbbbbbbbbbbbbbbb 大多数的情况
//
//        _bgbgImageview.frame =  CGRectMake(bili*10, bili*10, SCREEN_WIDTH-2*bili*10, zongHeight);
//        MCLog(@"zongHeight=%lf",zongHeight);
//        _bgbgImageview.image = [UIImage imageNamed:@"one"];
//
//        int j = _indepaths.row % 5;
//        MCLog(@"jjj=%zd===_indepaths.row==%zd",j,_indepaths.row);
//        switch (j+1) {
//
//            case 1:
//                _bgbgImageview.image = [UIImage imageNamed:@"bgoneYi"];
//
//                break;
//            case 2:
//                _bgbgImageview.image = [UIImage imageNamed:@"bgtwoYi"];
//
//                break;
//            case 3:
//                _bgbgImageview.image = [UIImage imageNamed:@"bgthreeYi"];
//
//                break;
//            case 4:
//                _bgbgImageview.image = [UIImage imageNamed:@"bgfourYi"];
//
//                break;
//
//            case 5:
//                _bgbgImageview.image = [UIImage imageNamed:@"bgfiveYi"];
//
//                break;
//
//            default:
//                break;
//        }
//        MCLog(@"_bgbgImageview=%@",NSStringFromCGRect(_bgbgImageview.frame));
//
//
//        _nameHospitalLab.frame = CGRectMake(10,bili*15,leftSpaceWidth-20, 40);
//        _nameHospitalLab.text = [NSString stringWithFormat:@"%@",dataDic[@"hospital_name"]];;//@"医院名字对对对打架啊垃圾家电家具记得记得就额就觉得的对对对";
//        _nameHospitalLab.textAlignment = NSTextAlignmentLeft;
//        _nameHospitalLab.font = [UIFont systemFontOfSize:14.0];
//        _nameHospitalLab.textColor  = [UIColor whiteColor];
//        _nameHospitalLab.numberOfLines = 2;//gzz180427
//        [_nameHospitalLab sizeToFit];
//
//        MCLog(@"nameHeight===%lf",_nameHospitalLab.height); //33.5
//
//        _departmentHospitalLab.frame = CGRectMake(10, bili*15+33.5+bili*7.5,  leftSpaceWidth-20,  20);
//        _departmentHospitalLab.text = [NSString stringWithFormat:@"%@",dataDic[@"office_name"]];//@"人工肝科室";
//        _departmentHospitalLab.font = [UIFont systemFontOfSize:12.0];
//        _departmentHospitalLab.textColor  = [UIColor whiteColor];
//        [_departmentHospitalLab sizeToFit];
//
//
//
//
//        _advisoryExpertLab.frame = CGRectMake(10, CGRectGetMaxY(_departmentHospitalLab.frame)+bili*7.5,  leftSpaceWidth-20,  20);
//        _advisoryExpertLab.text = @"全国肝胆病咨询专家";
//        _advisoryExpertLab.textAlignment = NSTextAlignmentCenter;
//        _advisoryExpertLab.font = [UIFont systemFontOfSize:10.0];
//        [_advisoryExpertLab sizeToFit];
//        _advisoryExpertLab.layer.cornerRadius = 8;
//        _advisoryExpertLab.layer.masksToBounds = YES;
//        _advisoryExpertLab.backgroundColor = [UIColor whiteColor];
//        _advisoryExpertLab.textColor = JISECOLOR;
//        _advisoryExpertLab.width = _advisoryExpertLab.width+20;
//        _advisoryExpertLab.height = _advisoryExpertLab.height+10;
//        NSString *is_starStr = [NSString stringWithFormat:@"%@",dataDic[@"is_star"]];
//        //        MCLog(@"_advisoryExpertLab==%lf",_advisoryExpertLab.height);
//        //is_star 1是0不是
//        if ([is_starStr isEqualToString:@"1"]) {
//            _advisoryExpertLab.hidden = NO;
//        }else{
//            _advisoryExpertLab.hidden = YES;
//        }
//
//
//        //        _originXuxianView.frame = CGRectMake(0,CGRectGetMaxY(_advisoryExpertLab.frame)+bili*7.5,leftSpaceWidth,1);
//
//
//        _originXuxianView.frame = CGRectMake(0,CGRectGetMaxY(_departmentHospitalLab.frame)+bili*7.5*2+_advisoryExpertLab.height,leftSpaceWidth,0.7);
//
//
//        [self drawDashLine:_originXuxianView lineLength:4 lineSpacing:2 lineColor:[UIColor whiteColor]];
//
//
//        _shusImageview.frame = CGRectMake(CGRectGetMaxX(_originXuxianView.frame), 0, 1,zongHeight);
//        _shusImageview.backgroundColor = [UIColor whiteColor];
//
//        _shusImageview.hidden = YES;
//
//
//        _headsImageview.frame = CGRectMake(10, CGRectGetMaxY(_originXuxianView.frame)+bili*10, 15*bili, 15*bili);
//        _headsImageview.backgroundColor = [UIColor clearColor];
//        _headsImageview.image = [UIImage imageNamed:@"patientNumHosWhite"];
//
//
//        _headslabel.frame = CGRectMake(CGRectGetMaxX(_headsImageview.frame), 1,rightSpaceWidth-20, 16);
//        _headslabel.text =  [NSString stringWithFormat:@"：%@",dataDic[@"apply_num"]];
//        _headslabel.textColor = WHITECOLORS;
//        _headslabel.textAlignment = NSTextAlignmentLeft;
//        _headslabel.font = [UIFont systemFontOfSize:12.0];
//        _headslabel.centerY = _headsImageview.centerY;
//
//        _lovesImageview.frame = CGRectMake(rightSpaceWidth+20, 5, 15*bili, 15*bili);
//        _lovesImageview.backgroundColor = [UIColor clearColor];
//        _lovesImageview.centerY = _headsImageview.centerY;
//        _lovesImageview.image = [UIImage imageNamed:@"ganCounsultNumHosWhite"];
//
//
//
//        _loveslabel.frame = CGRectMake(CGRectGetMaxX(_lovesImageview.frame), 1,rightSpaceWidth-30, 16);
//        _loveslabel.text = [NSString stringWithFormat:@"：%@",dataDic[@"consult_num"]];
//        _loveslabel.textColor = WHITECOLORS;
//        _loveslabel.textAlignment = NSTextAlignmentLeft;
//        _loveslabel.font = [UIFont systemFontOfSize:12.0];
//        _loveslabel.centerY = _headsImageview.centerY;
//
//
//
//
//        _photoImageview.frame = CGRectMake(CGRectGetMaxX(_shusImageview.frame), 0, rightSpaceWidth-1, CGRectGetMaxY(_lovesImageview.frame)+10*bili);
//        //        _photoImageview.backgroundColor = [UIColor redColor];// RGB(87 , 188, 224);
//
//        NSString  *imagename = [NSString stringWithFormat:@"%@%@",ImageUrl,dataDic[@"img"]];
//        [_photoImageview sd_setImageWithURL:[NSURL URLWithString:imagename] placeholderImage:[UIImage imageNamed:@"contentMren"]];
//        //
//
//        _advisoryNameLabe.frame = CGRectMake(leftSpaceWidth+1, CGRectGetMaxY(_departmentHospitalLab.frame)+bili*10, rightSpaceWidth-1,  20);
//        _advisoryNameLabe.text = [NSString stringWithFormat:@"%@",dataDic[@"name"]];;//@"专家名字a";
//        _advisoryNameLabe.textAlignment = NSTextAlignmentCenter;
//        _advisoryNameLabe.font = [UIFont systemFontOfSize:12.0];
//        [_advisoryNameLabe sizeToFit];
//        _advisoryNameLabe.layer.cornerRadius = 10;
//        _advisoryNameLabe.layer.masksToBounds = YES;
//        _advisoryNameLabe.backgroundColor = [UIColor whiteColor];
//        _advisoryNameLabe.textColor = JISECOLOR;
//        _advisoryNameLabe.width = _advisoryNameLabe.width+15;
//        _advisoryNameLabe.height = _advisoryNameLabe.height+4;
//        _advisoryNameLabe.x = leftSpaceWidth+(rightSpaceWidth-_advisoryNameLabe.width)/2;
//        _advisoryNameLabe.centerY = _originXuxianView.centerY;
//
//        ///7.5
//        _titleAdvisoryNameLabe.frame = CGRectMake(leftSpaceWidth+1, CGRectGetMaxY(_advisoryNameLabe.frame)+8*bili, rightSpaceWidth-1,12);
//        _titleAdvisoryNameLabe.font = [UIFont systemFontOfSize:10.0];
//        _titleAdvisoryNameLabe.text = [NSString stringWithFormat:@"%@",dataDic[@"position_name"]];//@"主任医师";
//        _titleAdvisoryNameLabe.textAlignment = NSTextAlignmentCenter;
//        _titleAdvisoryNameLabe.textColor = [UIColor whiteColor];
//
//        _bgbgImageview.height = CGRectGetMaxY(_lovesImageview.frame)+10*bili;
//
//        _shusImageview.height = CGRectGetMaxY(_lovesImageview.frame)+10*bili;
//
//
//        if (SCREEN_WIDTH == 414) {
//            _photoImageview.frame = CGRectMake(CGRectGetMaxX(_shusImageview.frame), -5, rightSpaceWidth-1, CGRectGetMaxY(_lovesImageview.frame)+10*bili);
//            _advisoryNameLabe.centerY = _originXuxianView.centerY+2;
//
//        }else if (SCREEN_WIDTH == 375){
//            _photoImageview.frame = CGRectMake(CGRectGetMaxX(_shusImageview.frame), -5, rightSpaceWidth-1, CGRectGetMaxY(_lovesImageview.frame)+10*bili);
//            //            _advisoryNameLabe.centerY = _originXuxianView.centerY+2;
//
//        }else if (SCREEN_WIDTH == 414){
//
//        }
//        else {//其他的按照六来
//            _photoImageview.frame = CGRectMake(CGRectGetMaxX(_shusImageview.frame), -5, rightSpaceWidth-1, CGRectGetMaxY(_lovesImageview.frame)+10*bili);
//            //            _advisoryNameLabe.centerY = _originXuxianView.centerY+2;
//        }
//
//
//        //        MCLog(@"left=%lf===height=%lf",rightSpaceWidth,_shusImageview.height);
//        //        MCLog(@"left/height=%lf",rightSpaceWidth/_shusImageview.height);
//
//        ////        MCLog(@"_originXuxianView=%@",NSStringFromCGRect(_originXuxianView.frame));
//
//    }
//
//
//
//

    //164.796875+bili*10 8plus
    // 8  155.9+bili*10
    // x 应该是与8一样 155.960938
    // 5 143.5+bili*10
    
    
//}
//
//
//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//    
//    // Configure the view for the selected state
//}
//
//@end


// */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
