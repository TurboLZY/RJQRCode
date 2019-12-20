//
//  RJScannerMaskView.m
//  BaseProject
//
//  Created by laizheyuan on 2019/12/20.
//  Copyright © 2019 TurboLZY. All rights reserved.
//

#import "RJScannerMaskView.h"

@implementation RJScannerMaskView

+ (instancetype)maskViewWithFrame:(CGRect)frame cropRect:(CGRect)cropRect {
    
    RJScannerMaskView *maskView = [[self alloc] initWithFrame:frame];
    
    maskView.backgroundColor = [UIColor clearColor];
    maskView.cropRect = cropRect;
    
    return maskView;
}

- (void)setCropRect:(CGRect)cropRect {
    _cropRect = cropRect;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [[UIColor colorWithWhite:0.0 alpha:0.4] setFill];
    CGContextFillRect(ctx, rect);
    
    CGContextClearRect(ctx, self.cropRect);
    
    [[UIColor colorWithWhite:0.95 alpha:1.0] setStroke];
    CGContextStrokeRectWithWidth(ctx, CGRectInset(_cropRect, 1, 1), 1);
}

@end
