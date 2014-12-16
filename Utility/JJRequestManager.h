//
//  JJRequestManager.h
//  sailingAboard
//
//  Created by xiangming on 14-12-16.
//  Copyright (c) 2014年 Noodles Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "JSONKit.h"

typedef void(^JJRequestManagerBlock)(id result);

@interface JJRequestManager : NSObject


+ (ASIFormDataRequest*)postRequestWithDict:(NSDictionary *)dict
                                      HOST:(NSString *)hostUrl
                                       API:(NSString *)api;

+ (ASIHTTPRequest *)getRequestWithDict:(NSDictionary *)dict
                                  HOST:(NSString *)hostUrl
                                   API:(NSString *)api;


/**
 *用户登陆请求
 请求示例: "http://182.92.227.144/cxf/jaxrs/sailboatport/sinalogin?studentId=12&nickname=昵称&avatar=http://www.baidu.com"
 */
+ (void)userLoginRequestWithParams:(NSDictionary *)param andCallBack:(JJRequestManagerBlock)callBack;

/*
 *获取职位列表请求
 请求示例:"http://182.92.227.144/cxf/jaxrs/sailboatport/jobs?studentId=114&pageNum=1"
 */
+ (void)getJobsRequestWithParams:(NSDictionary *)param andCallBack:(JJRequestManagerBlock)callBack;



/*
 *用户收藏职位列表请求
 *请求示例:" http://182.92.227.144/cxf/jaxrs/sailboatport/userjobs?studentId=114&pageNum=1
 */
+ (void)collectJobsRequestWithParams:(NSDictionary *)param andCallBack:(JJRequestManagerBlock)callBack;

/*
 *用户设置页面请求
 *请求示例:" HYPERLINK "http://182.92.227.144/cxf/jaxrs/sailboatport/settings?studentId=112&username=%E5%AD%A6%E7%94%9F%E5%90%8D%E7%A7%B0&gender=1&univers=66,67&500=1&tags=65,66"
 */

+ (void)userSettingRequestWithParams:(NSDictionary *)param andCallBack:(JJRequestManagerBlock)callBack;

/*
 *国家列表请求
 *请求示例:"http://182.92.227.144/cxf/jaxrs/sailboatport/countries" 
 */

+ (void)getCountriesRequestWithParams:(NSDictionary *)param andCallBack:(JJRequestManagerBlock)callBack;

/*
 *学校列表请求
 *请求示例:"http://182.92.227.144/cxf/jaxrs/sailboatport/universities?univType=2" 
 */
+ (void)getSchoolsOfCountriesRequestWithParams:(NSDictionary *)param andCallBack:(JJRequestManagerBlock)callBack;

/*
 *标签列表接口
 *请求示例:http://182.92.227.144/cxf/jaxrs/sailboatport/tagswithcate"
 */
+ (void)getTagsRequestWithParams:(NSDictionary *)param andCallBack:(JJRequestManagerBlock)callBack;

/*
 *设置收藏状态请求
 *请求示例:http://182.92.227.144/cxf/jaxrs/sailboatport/collect?studentId=112&jobId=126&collect=1
 
*/
+ (void)setCollectStatusRequestWithParams:(NSDictionary *)param andCallBack:(JJRequestManagerBlock)callBack;


@end
