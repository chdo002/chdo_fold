
//
//  extension.swift
//  chdo_fold
//
//  Created by chdo on 2017/3/14.
//  Copyright © 2017年 yw. All rights reserved.
//

import UIKit

// fold service
extension TableViewController {
    
    
    func reloadFold(){
        
    }
    
    func insertNewfold(){
        
        let newFold = NodeMD()
        newFold.parentNodeID = self.currentNode?.parentNodeID
        newFold.id = Date.timeStamp()
        newFold.nodeType = NodeType.fold.rawValue
        
        var textfield: UITextField!
        UIHelper.showTextAlert("Input Fold nmae", viewcontroller: self, textfieldHandler: { (field) in
            textfield = field
        }, comfireHandler: { (_) in
            
            newFold.nodeName = textfield.text
            newFold.createTimeStamp = Date.timeStamp()
            
            do {
                try NodeDB.saveNode(node: newFold)
            } catch let err {
                print(err.localizedDescription)
            }

        }) { (_) in
            
        }
    }
    
    func insertNewfile(){
        let newFold = NodeMD()
        newFold.parentNodeID = self.currentNode?.parentNodeID
        newFold.id = Date.timeStamp()
        newFold.nodeType = NodeType.file.rawValue
        
        var textfield: UITextField!
        UIHelper.showTextAlert("Input File nmae", viewcontroller: self, textfieldHandler: { (field) in
            textfield = field
        }, comfireHandler: { (_) in
            
            newFold.nodeName = textfield.text
            newFold.createTimeStamp = Date.timeStamp()
            
            do {
                try NodeDB.saveNode(node: newFold)
            } catch let err {
                print(err.localizedDescription)
            }
            
        }) { (_) in
            
        }
    }
    
    
    
}
