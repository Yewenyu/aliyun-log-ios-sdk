//
//  AliyunLogProducer.h
//  AliyunLogProducer
//
//  Created by lichao on 2020/9/27.
//  Copyright © 2020 lichao. All rights reserved.
//

#import <Foundation/Foundation.h>

//! Project version number for AliyunLogProducer.
FOUNDATION_EXPORT double AliyunLogProducerVersionNumber;

//! Project version string for AliyunLogProducer.
FOUNDATION_EXPORT const unsigned char AliyunLogProducerVersionString[];

#ifndef AliyunlogCommon_h
#define AliyunlogCommon_h

#define SLSLog(fmt, ...) NSLog((@"[SLSiOS] %s " fmt), __FUNCTION__, ##__VA_ARGS__);
#ifdef DEBUG
    #define SLSLogV(fmt, ...) NSLog((@"[SLSiOS] %s:%d: " fmt), __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
    #define SLSLogV(...);
#endif

#endif /* AliyunlogCommon_h */

// In this header, you should import all the public headers of your framework using statements like #import <AliyunLogProducer/PublicHeader.h>

#import <AliyunLogProducer/LogProducerClient.h>
#import <AliyunLogProducer/LogProducerConfig.h>
#import <AliyunLogProducer/Log.h>
#import <AliyunLogProducer/TimeUtils.h>
#import <AliyunLogProducer/SLSAdapter.h>
#import <AliyunLogProducer/SLSConfig.h>
#import <AliyunLogProducer/TCData.h>
