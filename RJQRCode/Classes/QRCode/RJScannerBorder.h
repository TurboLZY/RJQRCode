//
//  RJScannerBorder.h
//  BaseProject
//
//  Created by laizheyuan on 2019/12/20.
//  Copyright © 2019 TurboLZY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RJScannerBorder : UIView
/// 开始扫描动画
- (void)startScannerAnimating;
/// 停止扫描动画
- (void)stopScannerAnimating;

@end

NS_ASSUME_NONNULL_END
