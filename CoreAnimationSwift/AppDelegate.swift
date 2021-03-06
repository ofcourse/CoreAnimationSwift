//
//  AppDelegate.swift
//  CoreAnimationSwift
//
//  Created by user on 2017/10/8.
//  Copyright © 2017年 . All rights reserved.
//

import UIKit
import RxSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    //https://www.raywenderlich.com/tag/core-animation
    //http://www.cocoachina.com/ios/20160517/16290.html
  //iOS开发tips-UITableView、UICollectionView行高/尺寸自适应 http://www.cnblogs.com/kenshincui/p/6391312.html
  //iOS开发系列--让你的应用“动”起来 http://www.cnblogs.com/kenshincui/p/3972100.html#!comments
  //Core Animation Programming Guide  https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CoreAnimation_guide/CoreAnimationBasics/CoreAnimationBasics.html
   //https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309
    //swift http://www.cnblogs.com/kenshincui/p/4717450.html  http://www.cnblogs.com/kenshincui/p/4824810.html
    //https://swift.org/
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        Person.sayHi() //swift 引用oc代码
        t()
        return true
    }
    
    func t() {
        //RxSwift - 为什么存在 catchError https://segmentfault.com/p/1210000008635488/read
        let disposeBag:DisposeBag = DisposeBag()
        
        Observable<Int>.from([1, 2, 3, -1, 5])
            .map { value -> Int in
                if value > 0 {
                    return value
                } else {
                    //throw CustomError.myCustom
                    print("error")
                    throw MyCustomeError.C
                }
            }
            .debug()
            .subscribe()
            .disposed(by: disposeBag)
        
        Observable<Int>.from([1, 2, 3, -1, 5])
            .map { value -> Int in
                if value > 0 {
                    return value
                } else {
                    throw MyCustomeError.C
                }
            }
            .catchError { (error) -> Observable<Int> in
                return Observable.just(1)
            }
            .debug()
            .subscribe()
            .disposed(by: disposeBag)
        
        Observable<Int>.from([1, 2, 3, -1, 5])
            .flatMap { value -> Observable<Int> in
                Observable.just(value)
                    .map { value -> Int in
                        if value > 0 {
                            return value
                        } else {
                            throw MyCustomeError.C
                        }
                    }
                    .catchError { (error) -> Observable<Int> in
                        return Observable.empty()
                }
            }
            .debug()
            .subscribe()
            .disposed(by: disposeBag)
        
        Observable<Int>.from([1, 2, 3, -1, 5])
            .flatMap { value -> Observable<Int> in
                Observable.just(value)
                    .map { value -> Int in
                        if value > 0 {
                            return value
                        } else {
                            throw MyCustomeError.C
                        }
                    }
                    .catchErrorJustReturn(1)
            }
            .debug()
            .subscribe()
            .disposed(by: disposeBag)
        
        Observable<Int>.from([1, 2, 3, -1, 5])
            .map { value -> Int in
                if value > 0 {
                    return value
                } else {
                    throw MyCustomeError.C
                }
            }
            .catchErrorJustReturn(1)
            .debug()
            .subscribe()
            .disposed(by: disposeBag)
    }
    
    enum MyCustomeError:Error {
      case  C,T
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
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

    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        print("AppDelegate didReceiveMemoryWarning")
    }
}

