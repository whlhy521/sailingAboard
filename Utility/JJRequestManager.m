//
//  JJRequestManager.m
//  sailingAboard
//
//  Created by xiangming on 14-12-16.
//  Copyright (c) 2014年 Noodles Wang. All rights reserved.
//

#import "JJRequestManager.h"
#import "ASIFormDataRequest.h"

#define kRequsetTimeOut  12

@implementation JJRequestManager

+ (ASIFormDataRequest*)postRequestWithDict:(NSDictionary *)dict
                                      HOST:(NSString*)hostUrl
                                       API:(NSString *)api
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",hostUrl,api]];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setUseCookiePersistence:YES];
    [request setTimeOutSeconds:kRequsetTimeOut];
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [request setPostValue:obj forKey:key];
    }];
    return request;
}

+ (ASIHTTPRequest *)getRequestWithDict:(NSDictionary *)dict
                                  HOST:(NSString *)hostUrl
                                   API:(NSString *)api
{
    NSMutableDictionary *muDict = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSMutableString *params = [[NSMutableString alloc] init];
    for (id keys in muDict) {
        [params appendFormat:@"&%@=%@",keys,[muDict objectForKey:keys]];
    }
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@%@",hostUrl,api,params];
    NSMutableString *tempString = [[NSMutableString alloc] initWithString:urlStr];
    NSRange rang = [tempString rangeOfString:@"?"];
    if (rang.location == NSNotFound) {
        NSRange rang1 = [tempString rangeOfString:@"&"];
        if (rang1.location != NSNotFound) {
            [tempString replaceCharactersInRange:rang1 withString:@"?"];
        }
    }
    urlStr = [tempString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlStr];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setTimeOutSeconds:kRequsetTimeOut];
    return request;
}

/**
 *用户登陆请求
 请求示例: "http://182.92.227.144/cxf/jaxrs/sailboatport/sinalogin?studentId=12&nickname=昵称&avatar=http://www.baidu.com"
 */
+ (void)userLoginRequestWithParams:(NSDictionary *)param andCallBack:(JJRequestManagerBlock)callBack{
    ASIHTTPRequest *request = [JJRequestManager getRequestWithDict:param HOST:kBaseAppUrl API:kSinaWeiboLogin];
}

/*
 *获取职位列表请求
 请求示例:"http://182.92.227.144/cxf/jaxrs/sailboatport/jobs?studentId=114&pageNum=1"
 */
+ (void)getJobsRequestWithParams:(NSDictionary *)param andCallBack:(JJRequestManagerBlock)callBack
{
        ASIHTTPRequest *request = [JJRequestManager getRequestWithDict:param HOST:kBaseAppUrl API:kJobs];
}



+ (void)collectJobsRequestWithParams:(NSDictionary *)param andCallBack:(JJRequestManagerBlock)callBack
{
        ASIHTTPRequest *request = [JJRequestManager getRequestWithDict:param HOST:kBaseAppUrl API:kUserjobs];
}


+ (void)userSettingRequestWithParams:(NSDictionary *)param andCallBack:(JJRequestManagerBlock)callBack{
        ASIHTTPRequest *request = [JJRequestManager getRequestWithDict:param HOST:kBaseAppUrl API:kSettings];
}

/*
 *国家列表请求
 *请求示例:"http://182.92.227.144/cxf/jaxrs/sailboatport/countries"
 */

+ (void)getCountriesRequestWithParams:(NSDictionary *)param andCallBack:(JJRequestManagerBlock)callBack
{
        ASIHTTPRequest *request = [JJRequestManager getRequestWithDict:param HOST:kBaseAppUrl API:kCountries];
}

/*
 *学校列表请求
 *请求示例:"http://182.92.227.144/cxf/jaxrs/sailboatport/universities?univType=2"
 */
+ (void)getSchoolsOfCountriesRequestWithParams:(NSDictionary *)param andCallBack:(JJRequestManagerBlock)callBack
{
        ASIHTTPRequest *request = [JJRequestManager getRequestWithDict:param HOST:kBaseAppUrl API:kUniversities];
}

/*
 *标签列表接口
 *请求示例:http://182.92.227.144/cxf/jaxrs/sailboatport/tagswithcate"
 */
+ (void)getTagsRequestWithParams:(NSDictionary *)param andCallBack:(JJRequestManagerBlock)callBack
{
        ASIHTTPRequest *request = [JJRequestManager getRequestWithDict:param HOST:kBaseAppUrl API:kTagswithcate];
}

/*
 *设置收藏状态请求
 *请求示例:http://182.92.227.144/cxf/jaxrs/sailboatport/collect?studentId=112&jobId=126&collect=1
 
 */
+ (void)setCollectStatusRequestWithParams:(NSDictionary *)param andCallBack:(JJRequestManagerBlock)callBack
{
        ASIHTTPRequest *request = [JJRequestManager getRequestWithDict:param HOST:kBaseAppUrl API:kCollect];
}



@end
