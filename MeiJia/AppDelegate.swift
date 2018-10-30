//
//  AppDelegate.swift
//  MeiJia
//
//  Created by 江东 on 2018/10/29.
//  Copyright © 2018 oushelun. All rights reserved.
//

import UIKit
import UserNotifications
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    //打开音乐，播放音乐，为了保持后台
    let queue = DispatchQueue(label: "创建并行队列", attributes: .concurrent)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //请求通知权限
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) {
                (accepted, error) in
                if !accepted {
                    print("用户不允许消息通知。")
                }
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        queue.async {
            //通知内容
            let content = UNMutableNotificationContent()
            content.title = "欢迎您使用美嘉线上服务应用"
            content.body = "各种线上活动火热进行中，详情可向客服人员咨询！！！"
            //设置通知触发器
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
            //设置请求标识符
            let requestIdentifier = "1"
            //设置一个通知请求
            let request = UNNotificationRequest(identifier: requestIdentifier,content: content, trigger: trigger)
            //将通知请求添加到发送中心
            UNUserNotificationCenter.current().add(request) { error in
                if error == nil {
                    print("Time Interval Notification scheduled: \(requestIdentifier)")
                }
            }
            print("1 秒后输出")
        }
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

