
//
//  extension.swift
//  chdo_fold
//
//  Created by chdo on 2017/3/14.
//  Copyright © 2017年 yw. All rights reserved.
//

import Foundation


// fold service
extension TableViewController {
    
    
    func reloadFold(){
        
    }
    
    func insertNewfold(){
        let newFold = NodeMD()
        newFold.parentNodeID = self.currentNode?.parentNodeID
        newFold.id = Date.timeStamp()
        
        UIHelper.showTextAlert("Input node nmae", viewcontroller: self, comfireHandler: { (alert) in
            
        }) { (alert) in
            
        }
    }
    
    func insertNewfile(){
        
    }
    
    
    
}
