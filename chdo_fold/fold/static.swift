
import Foundation
import UIKit


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
        let cancle = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        actionSheet.addAction(cancle)
        viewcontroller.present(actionSheet, animated: true, completion: nil)
    }
    
    static func showTextAlert(_ title: String,
                       viewcontroller: UIViewController,
                     textfieldHandler: @escaping ((UITextField) -> Swift.Void),
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
    
    static func showAlert(message: String){
        
    }
}
