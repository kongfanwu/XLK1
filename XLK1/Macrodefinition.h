//
//  Macrodefinition.h
//  XLoongGlass
//
//  Created by 孔凡伍 on 16/5/6.
//  Copyright © 2016年 kongfanwu. All rights reserved.
//

#ifndef Macrodefinition_h
#define Macrodefinition_h

#import "AppDelegate.h"

#define SCREEN_WIDTH CGRectGetWidth([[UIScreen mainScreen] bounds])
#define SCREEN_HEIGHT CGRectGetHeight([[UIScreen mainScreen] bounds])
#define kScale SCREEN_WIDTH / 375.0

#define isSimulatora (NSNotFound != [[[UIDevice currentDevice] model] rangeOfString:@"Simulator"].location)

//当前软件版本号
#define BundleShortVersionString [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//当前build版本号
#define currentVersionString [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

#define isIphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define isIOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define isIOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define kSystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]
#define isIphone_6Plus (isIphone && [UIScreen mainScreen].scale == 3.0f)

#define COLOR_WITH_ARGB(R,G,B,A) [UIColor colorWithRed:R / 255.0 green:G / 255.0 blue:B / 255.0 alpha:A]
#define COLOR_WITH_RGB(R,G,B) COLOR_WITH_ARGB(R, G, B, 1)

// weak_self
#define WEAK_REF(obj) \
__weak typeof(obj) weak_##obj = obj; \

#define kStatueBarH 20.f
#define kNavBarH 64.f
#define kTabBarH 49.f

/** R ps字体大小 */
#define kFont(R) [UIFont systemFontOfSize:(isIphone_6Plus ? R + 0.5 : R)]
#define kBoldFont(R) [UIFont boldSystemFontOfSize:(isIphone_6Plus ? R + 0.5 : R)]

#define kApp ((AppDelegate *)[UIApplication sharedApplication].delegate)

//打开URL
#define canOpenURL(appScheme) ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:appScheme]])
#define openURL(appScheme) ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:appScheme]])

// 获取本地图片
#define kImageWithContentsOfFileName(name, type) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:type]]

#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

// 弧度转角度
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))
// 角度转弧度 CGAffineTransformMakeRotation中要填的是弧度
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

#define ShowAlert(m) [[[UIAlertView alloc] initWithTitle:@"" message:(m) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]show];

// 创建Storyboard里VC.
#define kStoryboardVC(name,VCId) [[UIStoryboard storyboardWithName:name bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:VCId]



#endif /* Macrodefinition_h */
