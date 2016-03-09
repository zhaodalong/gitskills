//
//  AppDelegate.m
//  CreateBtn
//
//  Created by 机房 on 15/12/11.
//  Copyright (c) 2015年 ts. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<UIAlertViewDelegate>

@end

//替换成自己的app下载地址
#define App_DownloadURL @"http://itunes.apple.com/app/id483504146?mt=8"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSString *version = [NSString stringWithFormat:@"Version %@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
    NSString *build = [NSString stringWithFormat:@"Build %@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]];
    NSLog(@"version : %@   build : %@",version,build);
    [self checkUpdate];
    
    //APNs
    if ([[UIDevice currentDevice].systemVersion floatValue] > 8.0) {
        UIUserNotificationType types = UIUserNotificationTypeBadge|UIUserNotificationTypeAlert|UIUserNotificationTypeSound;
        UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
    }else {
        UIRemoteNotificationType types = UIRemoteNotificationTypeAlert|UIUserNotificationTypeSound|UIUserNotificationTypeBadge;
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:types];
    }
    
    //userInfo为收到远程通知的内容
    NSDictionary *userInfo = launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey];
    if (userInfo) {
        //有推送的消息，处理推送的消息
        NSLog(@"有新的推送消息  :  %@",userInfo);
    }
    
    return YES;
}

//注册成功回调方法，其中deviceToken即为APNs返回的Token
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {

    NSLog(@"deviceToken : %@",deviceToken);
    //[self sendProviderDeviceToken:deviceToken];

}

//注册失败调用的方法
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {

    NSLog(@"注册远程通知失败，失败原因是 : %@",error.userInfo);

}

//如果app处于background状态时，只有用户点击了通知消息时才会调用该方法，如果app处于foreground状态，会直接调用该方法
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {

    

}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {

    //在此方法中一定要调用completionHandler这个回调，告诉系统是否处理成功
    if (userInfo) {
        completionHandler(UIBackgroundFetchResultNewData);
    }else {
        completionHandler(UIBackgroundFetchResultNoData);
    }

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [self checkUpdate];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {

    if (buttonIndex != [alertView cancelButtonIndex]) {
        NSURL *url = [NSURL URLWithString:App_DownloadURL];
        [[UIApplication sharedApplication] openURL:url];
    }

}

- (void)alertUpdate:(NSString *)strContent {

    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"升级提示" message:strContent delegate:self cancelButtonTitle:@"以后再说" otherButtonTitles:@"马上更新", nil];
    [alert show];

}

- (void)checkUpdate {

    NSString *sLastVersion = @"1.1";//取得最新版本
    NSString *sLastVersionInfo = @"Test Update Check!";//取得最新版本介绍
    if (![sLastVersion isEqualToString:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]]) {
        [self alertUpdate:sLastVersionInfo];
    }

}

@end
