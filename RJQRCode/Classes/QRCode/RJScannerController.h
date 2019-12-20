//
//  RJScannerController.h
//  BaseProject
//
//  Created by laizheyuan on 2019/12/20.
//  Copyright © 2019 TurboLZY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RJScannerController : UINavigationController
/// 使用 `名片字符串` 实例化扫描导航控制器
///
/// @param cardName   名片字符串
/// @param avatar     头像图像
/// @param completion 完成回调
///
/// @return 扫描导航控制器
+ (instancetype)scannerWithCardName:(NSString *)cardName avatar:(UIImage *)avatar completion:(void (^)(NSString *stringValue))completion;

/// 使用 名片字符串 / 头像 异步生成二维码图像，并且指定头像占二维码图像的比例
///
/// @param cardName     名片字符串
/// @param avatar     头像图像
/// @param scale      头像占二维码图像的比例
/// @param completion 完成回调
+ (void)cardImageWithCardName:(NSString *)cardName avatar:(UIImage *)avatar scale:(CGFloat)scale completion:(void (^)(UIImage *image))completion;

/// 设置导航栏标题颜色和 tintColor
///
/// @param titleColor 标题颜色
/// @param tintColor  tintColor
- (void)setTitleColor:(UIColor *)titleColor tintColor:(UIColor *)tintColor;

@end

NS_ASSUME_NONNULL_END
