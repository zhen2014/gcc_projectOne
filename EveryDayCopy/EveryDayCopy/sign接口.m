#import <CommonCrypto/CommonDigest.h>///MD5

newRollsignRequest
#pragma mark =========begin=====

#pragma mark signRequest接口调试
-(void)signRequest{
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/json",@"application/json",nil];
    
    //    NSString *Strurl = [NSString stringWithFormat:@"http://ceshi2.dsz360.com/app/expertApp/testSign"];
    NSString *Strurl = [NSString stringWithFormat:@"http://ceshi2.dsz360.com/app/expertApp/testCheckSign"];
    
    
    NSMutableDictionary * dicM = [NSMutableDictionary dictionary];
    dicM[@"client_type"] = [NSString stringWithFormat:@"%@",@"iOS"];//1
    
    dicM[@"expert_uuid"] = [NSString stringWithFormat:@"%@",@"c4jeNB99uVBt4Mbjlpz"];//2
    
    dicM[@"name"] = [NSString stringWithFormat:@"%@",@"gzz"];//3
    
    dicM[@"page"] = [NSString stringWithFormat:@"%@",@"1"];//4
    
    NSString *timestamp = [NSString stringWithFormat:@"%@",[self getNowTimeTimestamp]];
    dicM[@"timestamp"] = [NSString stringWithFormat:@"%@",timestamp];//5
    //    MCLog(@"时间===戳%@",dicM[@"timestamp"]);
    
    dicM[@"vresion"] = [NSString stringWithFormat:@"%@",@"2.7.6"];//6
    
    
    //1：sign 拼接字符串
    NSString *signStr = [NSString stringWithFormat:@"client_type%@expert_uuid%@name%@page%@timestamp%@vresion%@", dicM[@"client_type"],dicM[@"expert_uuid"],dicM[@"name"],dicM[@"page"],dicM[@"timestamp"] ,dicM[@"vresion"]];
    
    
    
    
    
    //2：时间戳MD5
    NSString *timeStampStr = [NSString stringWithFormat:@"%@",[self md5To32bit:dicM[@"timestamp"]]];
    
    //3：sign 拼接MD5
    signStr = [NSString stringWithFormat:@"%@%@",signStr,timeStampStr];
    
    //4：sign MD5加密
    signStr = [NSString stringWithFormat:@"%@",[self md5To32bit:signStr]];
    
    // 5：url base 64
    
    signStr = [NSString stringWithFormat:@"%@",[self safeUrlBase64Encode:[NSData data] str:signStr]];
    
    
    //6 request header
    AFHTTPRequestSerializer *requestSerializer =  [AFJSONRequestSerializer serializer];
    NSDictionary *headerFieldValueDictionary = @{@"sign":signStr};
    if (headerFieldValueDictionary != nil) {
        for (NSString *httpHeaderField in headerFieldValueDictionary.allKeys) {
            NSString *value = headerFieldValueDictionary[httpHeaderField];
            [requestSerializer setValue:value forHTTPHeaderField:httpHeaderField];
        }
    }
    manager.requestSerializer = requestSerializer;
    
    
//    http://ceshi2.dsz360.com/app/patientApp/patientrollNew
    
    
    //    MCLog(@"signStr=%@",signStr);
    
    
    
    [manager POST: Strurl parameters:dicM progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
              
              
              MCLog(@"----------");
              
              [MBProgressHUD hideHUDForView:self.view animated:YES];
          } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              [MBProgressHUD hideHUDForView:self.view animated:YES];
              
              MCLog(@"%@",error);
          }];
    
    
    
    
}
//base64
#pragma - 将saveBase64编码中的"-"，"_"字符串转换成"+"，"/"，字符串长度余4倍的位补"="
//+(NSData*)safeUrlBase64Decode:(NSString*)safeUrlbase64Str
//{
//    // '-' -> '+'
//    // '_' -> '/'
//    // 不足4倍长度，补'='
//    NSMutableString * base64Str = [[NSMutableString alloc]initWithString:safeUrlbase64Str];
//    base64Str = (NSMutableString * )[base64Str stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
//    base64Str = (NSMutableString * )[base64Str stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
//    NSInteger mod4 = base64Str.length % 4;
//    if(mod4 > 0)
//        [base64Str appendString:[@"====" substringToIndex:(4-mod4)]];
//    NSLog(@"Base64原文：%@", base64Str);
//    return [GTMBase64 decodeData:[base64Str dataUsingEncoding:NSUTF8StringEncoding]];
//
//}







//md5
- (NSString *)md5To32bit:(NSString *)str {
    
    const char *cStr = [str UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr),digest );
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    return result;
}


//iOS------获取当前时间和当前时间戳
//获取当前的时间

+(NSString*)getCurrentTimes{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    //现在时间,你可以输出来看下是什么格式
    
    NSDate *datenow = [NSDate date];
    
    //----------将nsdate按formatter格式转成nsstring
    
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    
    NSLog(@"currentTimeString =  %@",currentTimeString);
    
    return currentTimeString;
    
}

//获取当前时间戳有两种方法(以秒为单位)

- (NSString *)getNowTimeTimestamp{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    
    return timeSp;
    
}



+(NSString *)getNowTimeTimestamp2{
    
    
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    
    NSTimeInterval a=[dat timeIntervalSince1970];
    
    NSString*timeString = [NSString stringWithFormat:@"%0.f", a];//转为字符型
    
    ;
    
    return timeString;
    
}

//获取当前时间戳  （以毫秒为单位）

+(NSString *)getNowTimeTimestamp3{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SSS"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]*1000];
    
    return timeSp;
    
}


#pragma mark 排序算法

NSMutableDictionary * dicM = [NSMutableDictionary dictionary];
dicM[@"client_type"] = [NSString stringWithFormat:@"%@",@"iOS"];//1

dicM[@"expert_uuid"] = [NSString stringWithFormat:@"%@",@"c4jeNB99uVBt4Mbjlpz"];//2

dicM[@"name"] = [NSString stringWithFormat:@"%@",@"gzz"];//3

dicM[@"page"] = [NSString stringWithFormat:@"%@",@"1"];//4

NSString *timestamp = @"123234234243";// [NSString stringWithFormat:@"%@",[self getNowTimeTimestamp]];
dicM[@"timestamp"] = [NSString stringWithFormat:@"%@",timestamp];//5
//    MCLog(@"时间===戳%@",dicM[@"timestamp"]);

dicM[@"vresion"] = [NSString stringWithFormat:@"%@",@"2.7.6"];//6



NSArray *keyArr = @[@"vresion",@"page",@"name",@"client_type",@"timestamp",@"expert_uuid"];
//sign 拼接字符串
//    NSString *signStr = [NSString stringWithFormat:@"client_type%@expert_uuid%@name%@page%@timestamp%@vresion%@", dicM[@"client_type"],dicM[@"expert_uuid"],dicM[@"name"],dicM[@"page"],dicM[@"timestamp"] ,dicM[@"vresion"]];

NSLog(@"keyArrsort==%@",[self array:keyArr dicData:dicM] );
}

- (NSString *)array:(NSArray *)arr  dicData:(NSMutableDictionary *)dic{
    
    
    NSStringCompareOptions comparisonOptions = NSCaseInsensitiveSearch|NSNumericSearch|
    
    NSWidthInsensitiveSearch|NSForcedOrderingSearch;
    
    NSComparator sort = ^(NSString *obj1,NSString *obj2){
        
        NSRange range = NSMakeRange(0,obj1.length);
        
        return [obj1 compare:obj2 options:comparisonOptions range:range];
        
    };
    
    NSArray *resultArray = [arr sortedArrayUsingComparator:sort];
    
    NSLog(@"字符串数组排序结果%@",resultArray);
    NSMutableString *strM = [[NSMutableString alloc]initWithCapacity:10];;
    //      [strM setString:@"1234"];
    //    NSString *string0;
    for (int i=0; i<resultArray.count; i++) {
        
        
        NSString *keyStr = [NSString stringWithFormat:@"%@",resultArray[i]];
        NSString *valueStr = [NSString stringWithFormat:@"%@",dic[keyStr]];
        
        
        NSLog(@"%@,%@",keyStr,valueStr);
        NSString* str = [NSString stringWithFormat:@"%@%@",keyStr,valueStr];
        [strM appendString:str];
        //        [string0 stringByAppendingString:str] ;
        
        
    }
    
    NSLog(@"string0==%@",strM);
    
    return [strM copy];
    
}





#pragma mark =========end=====
