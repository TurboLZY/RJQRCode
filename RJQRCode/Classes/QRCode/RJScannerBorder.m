//
//  RJScannerBorder.m
//  BaseProject
//
//  Created by laizheyuan on 2019/12/20.
//  Copyright © 2019 TurboLZY. All rights reserved.
//

#import "RJScannerBorder.h"

@implementation RJScannerBorder {
    /// 冲击波图像
    UIImageView *scannerLine;
    /// 图像文件包
    NSBundle *imageBundle;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self prepareUI];
    }
    return self;
}

#pragma mark - 扫描动画方法
/// 开始扫描动画
- (void)startScannerAnimating {
    
    [self stopScannerAnimating];
    
    [UIView animateWithDuration:3.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [UIView setAnimationRepeatCount:MAXFLOAT];
                         
                         scannerLine.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height);
                     } completion:nil];
}

/// 停止扫描动画
- (void)stopScannerAnimating {
    [scannerLine.layer removeAllAnimations];
    scannerLine.center = CGPointMake(self.bounds.size.width * 0.5, 0);
}

#pragma mark - 设置界面
- (void)prepareUI {
    self.clipsToBounds = YES;
    
    // 图像文件包
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSURL *url = [bundle URLForResource:@"HMScanner" withExtension:@"bundle"];
    imageBundle = [NSBundle bundleWithURL:url];
    
    // 冲击波图像
    scannerLine = [[UIImageView alloc] initWithImage:[self imageWithName:@"QRCodeScanLine"]];
    scannerLine.frame = CGRectMake(0, 0, self.bounds.size.width, scannerLine.bounds.size.height);
    scannerLine.center = CGPointMake(self.bounds.size.width * 0.5, 0);
    
    for (NSInteger i = 1; i < 5; i++) {
        NSString *imgName = [NSString stringWithFormat:@"ScanQR%zd", i];
        UIImageView *img = [[UIImageView alloc] initWithImage:[self imageWithName:imgName]];
        
        [self addSubview:img];
        
        CGFloat offsetX = self.bounds.size.width - img.bounds.size.width;
        CGFloat offsetY = self.bounds.size.height - img.bounds.size.height;
        
        switch (i) {
            case 2:
                img.frame = CGRectOffset(img.frame, offsetX, 0);
                break;
            case 3:
                img.frame = CGRectOffset(img.frame, 0, offsetY);
                break;
            case 4:
                img.frame = CGRectOffset(img.frame, offsetX, offsetY);
                break;
            default:
                break;
        }
    }
    
    [self addSubview:scannerLine];
}

- (UIImage *)imageWithName:(NSString *)imageName {
    NSString *fileName = [NSString stringWithFormat:@"%@@2x", imageName];
    NSString *path = [imageBundle pathForResource:fileName ofType:@"png"];
    
    return [UIImage imageWithContentsOfFile:path];
}

@end
