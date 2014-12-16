//
//  JJMacro.h
//  sailingAboard
//
//  Created by xiangming on 14-12-16.
//  Copyright (c) 2014年 Noodles Wang. All rights reserved.
//

#ifndef sailingAboard_JJMacro_h
#define sailingAboard_JJMacro_h



/**
 *
 * 网络数据接口
 *
 **/


#pragma mark - 网络数据接口

#define kBaseAppUrl                 @"http://182.92.227.144/cxf/jaxrs/sailboatport/"

#define kSinaWeiboLogin             @"sinalogin"      //用户登录接口

#define kJobs                       @"jobs"           //职位列表接口

#define kUserjobs                   @"userjobs"       //用户收藏职位列表接口

#define kSettings                   @"settings"       //用户设置页面接口

#define kCountries                  @"countries"      //国家列表接口

#define kUniversities               @"universities"   //学校列表接口

#define kTagswithcate               @"tagswithcate"   //标签列表接口

#define kCollect                    @"collect"        //设置收藏状态接口


/**
 *
 * 方法简化名
 *
 **/
#pragma mark - 方法简化名

#define Version                         [[[UIDevice currentDevice] systemVersion] floatValue]       //获取当前设备的版本
#define DefaultValueForKey(key)         [[NSUserDefaults standardUserDefaults] valueForKey:key]     //从defaults中取值
#define SetValueForKey(dic,value,key)   [dic setValue:value forKey:key]                             //给字典设置键值对
#define DoubleToString(x)               [NSString stringWithFormat:@"%f",x]                         //double类型转string类型
#define IntToString(x)                  [NSString stringWithFormat:@"%d",x]                         //int类型转string类型
#define ObjToString(obj)                [NSString stringWithFormat:@"%@",obj]                       //id类型转string类型

#define Color(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]                //获取颜色的方法
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define DEFINE_SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;

#define DEFINE_SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}



/**
 *
 * 适配使用的常量
 *
 **/
#pragma mark - 常量

#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

#define kToolBarHeight  44
#define KStateBarHeight 20
#define kTabBarHeight   49
#define kMenuHeight     52
#define kSubMenuHeight  116.5

#define kShowHeight kHeight - kToolBarHeight - KStateBarHeight


/**
 *
 * 保存文件的文件名
 *
 **/
#pragma mark - 保存文件的文件名





/**
 *
 * 保存数据等键/值
 *
 **/
#pragma mark - 保存数据等键/值






/**
 *
 * 通知名称
 *
 **/
#pragma mark- 通知名称




#endif

