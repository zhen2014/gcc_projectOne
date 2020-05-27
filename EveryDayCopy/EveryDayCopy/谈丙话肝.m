//
//  谈丙话肝.m
//  EveryDayCopy
//
//  Created by gao zhen on 2018/6/28.
//  Copyright © 2018年 gao zhen. All rights reserved.
//

#import "谈丙话肝.h"

@implementation ____


//
//  TalkBingGanViewController.m
//  Patient
//
//  Created by gao zhen on 2017/9/25.
//  Copyright © 2017年 ShangYu. All rights reserved.
//

#import "TalkBingGanViewController.h"
#import <WebKit/WebKit.h>
#import "UMSocial.h"

#import "TFHpple.h"
#import "UIImageView+WebCache.h"
#import "CommonTools.h"

@interface TalkBingGanViewController ()<WKNavigationDelegate,UMSocialUIDelegate,WKUIDelegate>{
    
    
    WKWebView *wkkkwebView;
    
    UIImageView *imagevview;
    NSString *urlStr;//谈丙话肝的路径
    NSString *contentStr;//分享内容
    BOOL isStop ;
    
    //    NSString *titleStr;
}

@end

@implementation TalkBingGanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(188, 188, 188);
    self.navigationItem.title = @"谈丙话肝";
    
    isStop = YES;
    //gzz0924share
    UIBarButtonItem *shareRight = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"iconfont-fenxiang"] originalImage] style:UIBarButtonItemStylePlain target:self action:@selector(sharedAction)];
    shareRight.tintColor = WHITECOLORS;
    self.navigationItem.rightBarButtonItem = shareRight;
    //
    //    NSString  *imagename=[NSString stringWithFormat:@"%@%@",ImageUrl,_StrImager];
    imagevview=[[UIImageView alloc]init];
    imagevview.image = [UIImage imageNamed:@"iconShareMM"];
    //    [imagevview sd_setImageWithURL:[NSURL URLWithString:imagename] placeholderImage:[UIImage imageNamed:@"moren"]];
    //
    
    
    // 自适应屏幕大小 iconShareMM
    NSString *jScript = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);";
    
    WKUserScript *wkUScript = [[WKUserScript alloc] initWithSource:jScript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    
    WKUserContentController *wkUController = [[WKUserContentController alloc] init];
    
    [wkUController addUserScript:wkUScript];
    
    WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
    
    wkWebConfig.userContentController = wkUController;
    
    wkkkwebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) configuration:wkWebConfig];
    
    wkkkwebView.navigationDelegate = self;
    wkkkwebView.scrollView.scrollEnabled = YES;
    
    wkkkwebView.UIDelegate = self;//gzz180628
    [wkkkwebView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
    
    
    //    NSString *url = [NSString stringWithFormat:@"%@",@"http://gdwx.dsz360.com/bing/index?share=1"];
    urlStr =  KtanbingHuaganUrl;
    //    KtanbingHuagan
    NSString *url = [NSString stringWithFormat:@"%@",KtanbingHuaganUrl];
    
    //测试的url http://gdwx.dsz360.com/bing/index?share=1
    // 正式的 url http://wx.igandan.com/bing/index?share=1
    
    //http://meditool.cn/Medicoolshare/medicalknowledge?commonid=18461&drugtype=1&msgtype=1
    
    //     NSString *url = [NSString stringWithFormat:@"%@",@"http://meditool.cn/Medicoolshare/medicalknowledge?commonid=18461&drugtype=1&msgtype=1"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL
                                                                        URLWithString:url]];
    //3.加载请求
    [wkkkwebView loadRequest:request];
    //4. 视图添加
    [self.view addSubview:wkkkwebView];
    
}
//WkWebView的 回调
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"title"]) {
        if (object == wkkkwebView) {
            self.title = wkkkwebView.title;
        } else {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        
    }
    
}






// 2.页面开始加载时调用
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    isStop = YES;
    //    NSLog(@"----didStartProvisionalNavigation  navigationAction.request");
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    
}

// 4.页面加载完成之后调用

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
    //    NSLog(@"---didFinishNavigation");
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    //      [webView  stringByEvaluatingJavaScriptFromString:@"document.documentElement.getElementsByClassName('flexbox dl-app-banner')[0].style.display = 'none'"];
    
    //    [webView evaluateJavaScript:@"document.documentElement.getElementsByClassName('flexbox dl-app-banner')[0].style.display = 'none'" completionHandler:^(id _Nullable response, NSError * _Nullable error) {
    //        //        NSLog(@"response3: %@ error: %@", response, error);
    //    }];
    
    //gzz171109 不让其有捏合手势
    NSString *injectionJSString = @"var script = document.createElement('meta');"
    "script.name = 'viewport';"
    "script.content=\"width=device-width, initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0, user-scalable=no\";"
    "document.getElementsByTagName('head')[0].appendChild(script);";
    //    [webView stringByEvaluatingJavaScriptFromString:injectionJSString];
    
    [webView evaluateJavaScript:injectionJSString completionHandler:^(id result, NSError * _Nullable error) {
        
    }];
    
    
    
    
    
    NSString *lJs = @"document.documentElement.innerHTML";//获取当前网页的html
    //    self.currentHTML = [webView stringByEvaluatingJavaScriptFromString:lJs];
    
    [webView evaluateJavaScript:lJs completionHandler:^(id result, NSError * _Nullable error) {
        //        MCLog(@"网页内容==%@",[self getZZwithString:result]);
        //        MCLog(@"网页内容==%@",result);
        NSData *data =[result dataUsingEncoding:NSUTF8StringEncoding];
        TFHpple * doc   =  [[TFHpple alloc]initWithHTMLData:data];
        
        //        NSArray * elements = [doc searchWithXPathQuery:@"//a"];
        NSArray * elements = [doc searchWithXPathQuery:@"//p"];
        
        //
        
        NSLog(@"a节点个数：%zd",elements.count);
        for (int i = 0; i < elements.count; i++) {
            TFHppleElement * e = [elements objectAtIndex:i];
            NSLog(@"1：%@",[e text]);
            // The text inside the HTML element (the content of the first text node)
            
            
            NSString *str  = [e text];
            str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
            if (isStop) {
                if (![str isEqualToString:@"(null)"] && ![str isEqualToString:@"null"] &&![str isEqualToString:@"<null>"]  && str.length>0) {
                    contentStr = str;
                    isStop = NO;
                }
            }
            
            
            NSLog(@"2：%@",[e tagName]);       // "a"
            NSLog(@"3：%@",[e attributes]);    // NSDictionary of href, class, id, etc.
            NSLog(@"4：%@",[e objectForKey:@"href"]);       // Easy access to single attribute
            NSLog(@"5：%@",[e firstChildWithTagName:@"img"]); // The first "b" child node
            MCLog(@"6====%@",[e content]);
            NSLog(@"===========解析完毕一次===========");
        }
        
        
        
    }];
    
    //
    ////    NSString *htmlNum = @"document.getElementById('p').innerText";
    //    NSString *htmlNum = @"document.getElementsByTagName(‘html’)[0].innerHTML";
    //    [webView evaluateJavaScript:htmlNum completionHandler:^(id result, NSError * _Nullable error) {
    //                MCLog(@"htmlNum==%@",result);
    //
    //
    //
    //    }];
    //
    
    //    NSData  * dat a     = [NSData dataWithContentsOfFile:@"/Users/HeYang/Documents/Xcode/object-c/第三方库hpple的学习/hppleTest/hppleTest/index.html"];
    //    NSLog(@"数据：%@",data);
    //    TFHpple * doc      = [[TFHpple alloc] initWithHTMLData:data];
    
    
    
    
    
    
    //
    
    
}


- (NSString *)getZZwithString:(NSString *)string{
    NSRegularExpression *regularExpretion=[NSRegularExpression regularExpressionWithPattern:@"<[^>]*>|\n" options:0 error:nil];
    string = [regularExpretion stringByReplacingMatchesInString:string options:NSMatchingReportProgress range:NSMakeRange(0, string.length) withTemplate:@""];
    return string;
}


// 页面加载失败时调用
-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    //    NSLog(@"---didFailNavigation");
    
    
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    
    //    WKNavigationActionPolicyCancel,
    //    WKNavigationActionPolicyAllow,
    //    navigationAction.sourceFrame;
    //    navigationAction.targetFrame;
    //        navigationAction.request;
    
    //    if (navigationAction.navigationType == WKNavigationTypeLinkActivated){
    //        decisionHandler(WKNavigationActionPolicyCancel);
    //    }else{
    decisionHandler(WKNavigationActionPolicyAllow);//都要允许
    //    }
    
    
    //gzz171109 每次进入其他的网页都会进入这个方法 重新更改url
    urlStr = navigationAction.request.URL.absoluteString;//gzz171110
    //    NSString *url = navigationAction.request.URL.absoluteString;//gzz171110
    NSLog(@"url=====%@",urlStr);
    
    
    //获取当前页面的title
    //    NSString *title ＝ [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    [webView evaluateJavaScript:@"document.title" completionHandler:^(id result, NSError * _Nullable error) {
        MCLog(@"title==========%@",result);//gzz180627
        
    }];
    
}



#pragma mark share 分享
-(void)sharedAction{
    
    [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToSina,UMShareToWechatSession, UMShareToWechatTimeline]];
    
    NSString *text = [NSString stringWithFormat:@"=====Content===%@",contentStr];
    //contentStr wkkkwebView.title]
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"566fa456e0f55a546d001b93"
     
                                      shareText:text//@"谈丙话肝"//_TitTEXtStr
                                     shareImage:imagevview.image
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina, nil]
                                       delegate:self];
    
    [UMSocialData defaultData].extConfig.wechatSessionData.url = [NSString stringWithFormat:@" %@",urlStr];
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = [NSString stringWithFormat:@" %@",urlStr];
    
    //    [UMSocialData defaultData].extConfig.title =[NSString stringWithFormat:@"%@",@"谈丙话肝"];
    [UMSocialData defaultData].extConfig.title =[NSString stringWithFormat:@"%@标题",wkkkwebView.title];//上面那个
    
    //    [UMSocialData defaultData].extConfig.wechatTimelineData.title =[NSString stringWithFormat:@"%@",@"肝胆相照®带您了解丙肝"];
    if ([wkkkwebView.title isEqualToString:@"谈丙话肝"]) {
        [UMSocialData defaultData].extConfig.wechatTimelineData.title =[NSString stringWithFormat:@"%@",@"肝胆相照®带您了解丙肝"];
    }else{
        [UMSocialData defaultData].extConfig.wechatTimelineData.title =[NSString stringWithFormat:@"%@111111",contentStr];
    }
    
}

-(void)didSelectSocialPlatform:(NSString *)platformName withSocialData:(UMSocialData *)socialData
{
    if (platformName == UMShareToSina) {
        
        //        socialData.shareText = [NSString stringWithFormat:@"分享来自“肝胆相照”的文章:%@ %@",@"谈丙话肝",urlStr];
        socialData.shareText = [NSString stringWithFormat:@"分享来自“肝胆相照”的文章:%@ %@",wkkkwebView.title,urlStr];
        
        
    }
    else{
        
        //        socialData.shareText = [NSString stringWithFormat:@"%@",@"肝胆相照®带您了解丙肝"];
        if ([wkkkwebView.title isEqualToString:@"谈丙话肝"]) {
            [UMSocialData defaultData].extConfig.wechatTimelineData.title =[NSString stringWithFormat:@"%@",@"肝胆相照®带您了解丙肝"];
        }else{
            [UMSocialData defaultData].extConfig.wechatTimelineData.title =[NSString stringWithFormat:@"3322222%@442222",contentStr];
        }
        
        
    }
}

-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
        //        MCLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
        if (response.responseCode==200) {
            //            [self showHint:@"分享成功"];
        }
    }
}



- (void)dealloc{//gzz171110
    [wkkkwebView removeObserver:self forKeyPath:@"title"];
    
    [wkkkwebView reload];
    wkkkwebView = nil;
    MCLog(@"dealloc");
    
    
}


@end

@end
