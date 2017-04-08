//
//  AppDelegate.swift
//  chdo_fold
//
//  Created by chdo on 2017/3/14.
//  Copyright © 2017年 yw. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let root = createRootNode()
        
        let vc = TableViewController()
            vc.currentNode = root
        
        let navi = UINavigationController(rootViewController: vc)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navi
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    func createRootNode() -> NodeMD {
        // 设置根目录
        let rel = try? Realm()
        let root = NodeMD()
        root.id = "root"
        root.nodeName = "根目录"
        root.createTimeStamp = Date.timeStamp()
        root.nodeType = NodeType.fold.rawValue
        try? rel?.write {
            rel?.add(root, update: true)
        }
        return root
    }

}

