//
//  RJScannerViewController.h
//  BaseProject
//
//  Created by laizheyuan on 2019/12/20.
//  Copyright © 2019 TurboLZY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RJScannerViewController : UIViewController

/// 实例化扫描控制器
///
/// @param cardName   名片字符串
/// @param avatar     头像图片
/// @param completion 完成回调
///
/// @return 扫描控制器
- (instancetype)initWithCardName:(NSString *)cardName avatar:(UIImage *)avatar completion:(void (^)(NSString *stringValue))completion;

@end

NS_ASSUME_NONNULL_END
