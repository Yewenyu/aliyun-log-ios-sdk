//
//  Example1.m
//  AliyunLogProducerSampleOC
//
//  Created by lichao on 2020/10/28.
//  Copyright © 2020 lichao. All rights reserved.
//

#import "ViewController.h"
#import "AliyunLogProducer/AliyunLogProducer.h"

/**
    不开启离线缓存
 */
@interface ViewController ()

@end

@implementation ViewController

LogProducerClient* client = nil;

NSString* endpoint = @"https://cn-hangzhou.log.aliyuncs.com";
NSString* project = @"k8s-log-c783b4a12f29b44efa31f655a586bb243";
NSString* logstore = @"666";
NSString* accesskeyid = @"";
NSString* accesskeysecret = @"";

int x = 0;


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *Path = [[paths lastObject] stringByAppendingString:@"/log.dat"];
    
    LogProducerConfig* config = [[LogProducerConfig alloc] initWithEndpoint:endpoint project:project logstore:logstore accessKeyID:accesskeyid accessKeySecret:accesskeysecret];

    client = [[LogProducerClient alloc] initWithLogProducerConfig:config];
}

- (IBAction)send:(id)sender {
    [self sendOneLog];
}

-(void)sendOneLog {
    Log* log = [self getOneLog];
    [log PutContent:@"index" value:[@(x) stringValue]];
    x = x + 1;
    LogProducerResult res = [client AddLog:log];

    NSLog(@"%ld", res);
}

-(Log*)getOneLog {
    Log* log = [[Log alloc] init];
    [log PutContent:@"content_key_1" value:@"1abcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+abcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+abcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+"];
    [log PutContent:@"content_key_2" value:@"2abcdefghijklmnopqrstuvwxyz0123456789"];
    [log PutContent:@"content_key_3" value:@"3abcdefghijklmnopqrstuvwxyz0123456789"];
    [log PutContent:@"content_key_4" value:@"4abcdefghijklmnopqrstuvwxyz0123456789"];
    [log PutContent:@"content_key_5" value:@"5abcdefghijklmnopqrstuvwxyz0123456789"];
    [log PutContent:@"content_key_6" value:@"6abcdefghijklmnopqrstuvwxyz0123456789"];
    [log PutContent:@"content_key_7" value:@"7abcdefghijklmnopqrstuvwxyz0123456789"];
    [log PutContent:@"content_key_8" value:@"8abcdefghijklmnopqrstuvwxyz0123456789"];
    [log PutContent:@"content_key_9" value:@"9abcdefghijklmnopqrstuvwxyz0123456789"];
    [log PutContent:@"content" value:@"中文"];
    return log;
}

@end
