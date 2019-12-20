//
//  RJScannerController.m
//  BaseProject
//
//  Created by laizheyuan on 2019/12/20.
//  Copyright © 2019 TurboLZY. All rights reserved.
//

#import "RJScannerController.h"
#import "RJScannerViewController.h"
#import "RJScanner.h"

@interface RJScannerController ()

@end

@implementation RJScannerController

+ (void)cardImageWithCardName:(NSString *)cardName avatar:(UIImage *)avatar scale:(CGFloat)scale completion:(void (^)(UIImage *))completion {
    [RJScanner qrImageWithString:cardName avatar:avatar scale:scale completion:completion];
}

+ (instancetype)scannerWithCardName:(NSString *)cardName avatar:(UIImage *)avatar completion:(void (^)(NSString *))completion {
    NSAssert(completion != nil, @"必须传入完成回调");
    
    return [[self alloc] initWithCardName:cardName avatar:avatar completion:completion];
}

- (instancetype)initWithCardName:(NSString *)cardName avatar:(UIImage *)avatar completion:(void (^)(NSString *))completion {
    self = [super init];
    if (self) {
        RJScannerViewController *scanner = [[RJScannerViewController alloc] initWithCardName:cardName avatar:avatar completion:completion];
        
        [self setTitleColor:[UIColor whiteColor] tintColor:[UIColor greenColor]];
        
        [self pushViewController:scanner animated:YES];
    }
    return self;
}

- (void)setTitleColor:(UIColor *)titleColor tintColor:(UIColor *)tintColor {
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: titleColor}];
    self.navigationBar.tintColor = tintColor;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


@end
