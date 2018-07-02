//
//  NGAppLauncher.m
//  nigimitama
//
//  Created by tauCross on 2018/7/2.
//  Copyright © 2018年 tc. All rights reserved.
//

#import "NGAppLauncher.h"



@implementation NGAppLauncher

+ (void)lauch
{
    [NGAppLauncher standardLauncher];
}

+ (instancetype)standardLauncher
{
    static NGAppLauncher *launcher = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        launcher = [[NGAppLauncher alloc] init];
    });
    return launcher;
}

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        
    }
    return self;
}

@end
