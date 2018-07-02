//
//  macro.h
//  nigimitama
//
//  Created by tauCross on 2018/7/2.
//  Copyright © 2018年 tc. All rights reserved.
//

#ifndef macro_h
#define macro_h



#pragma mark - Log

#ifdef DEBUG
#define DLog(fmt, ...) printf("%s\n", [[NSString stringWithFormat:(@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__] UTF8String]);
#else
#define DLog(...)
#endif




#pragma mark - UI

#define NGImage(name)           [UIImage imageNamed:name]

#define SCREEN_HEIGHT           ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_WIDTH            ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_SCALE            ([UIScreen mainScreen].scale)



#endif /* macro_h */
