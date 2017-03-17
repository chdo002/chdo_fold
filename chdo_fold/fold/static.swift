//
//  static.swift
//  chdo_fold
//
//  Created by chdo on 2017/3/14.
//  Copyright © 2017年 yw. All rights reserved.
//

import Foundation
import UIKit

public enum NodeType: Int8 {
    case fold = 0
    case file = 1
}

extension Int8 {
    
    var nodeType: NodeType {
        switch self {
        case NodeType.file.rawValue:
            return NodeType.file
        default:
            return NodeType.fold
        }
    }
    
    var isFold: Bool {
        return self == NodeType.fold.rawValue
    }
}

extension Date {
    static func timeStamp() -> String {
        let long = Int64(Date().timeIntervalSince1970 * 1000)
        return "\(long)"
    }
}

class UIHelper {
    
    static func showActionSheet(_ title: String,
                         viewcontroller: UIViewController,
                                actions: (name: String, handler: (UIAlertAction) -> Swift.Void)...)
    {
        let actionSheet = UIAlertController(title: "addNode", message: nil, preferredStyle: .actionSheet)
        for ac in actions {
            let action = UIAlertAction(title: ac.name, style: .default, handler: ac.handler)
            actionSheet.addAction(action)
        }
        let cancle = UIAlertAction(title: "qux", style: .cancel, handler: nil)
        actionSheet.addAction(cancle)
        viewcontroller.present(actionSheet, animated: true, completion: nil)
    }
    
    
    static func showTextAlert(_ title: String,
                       viewcontroller: UIViewController,
                     textfieldHandler: ((UITextField) -> Swift.Void)? = nil,
                       comfireHandler: @escaping (UIAlertAction) -> Swift.Void,
                        cancleHandler: @escaping (UIAlertAction) -> Swift.Void)
    {
        let alertSction = UIAlertController(title: title, message: nil, preferredStyle: .alert)
            alertSction.addTextField(configurationHandler: textfieldHandler)
        let confirm = UIAlertAction(title: "确定", style: .default, handler: comfireHandler)
        let cancle  = UIAlertAction(title: "取消", style: .cancel , handler: cancleHandler)
        alertSction.addAction(confirm)
        alertSction.addAction(cancle)
        viewcontroller.present(alertSction, animated: true, completion: nil)
    }
}
