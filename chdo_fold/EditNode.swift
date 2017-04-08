//
//  DeleteNode.swift
//  chdo_fold
//
//  Created by chdo on 2017/4/7.
//  Copyright © 2017年 yw. All rights reserved.
//

import UIKit
import RealmSwift

// 编辑
extension TableViewController {
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let rename = UITableViewRowAction(style: .normal, title: "重命名") { (ac, index) in
            if indexPath.section == 0 {
                self.reNameAction(node: self.nodes.folds[indexPath.row])
            } else if indexPath.section == 1 {
                self.reNameAction(node: self.nodes.files[indexPath.row])
            }
        }
        
        let delete = UITableViewRowAction(style: UITableViewRowActionStyle.destructive, title: "删除") { (ac, index) in
            if indexPath.section == 0 {
                self.deleteAction(node: self.nodes.folds[indexPath.row])
            } else if indexPath.section == 1 {
                self.deleteAction(node: self.nodes.files[indexPath.row])
            }
        }
        return [delete, rename]
    }
    
    func reNameAction(node: NodeMD){
        var fie: UITextField!
        UIHelper.showTextAlert("重命名", viewcontroller: self, textfieldHandler: { (field) in
            field.text = node.nodeName
            fie = field
        }, comfireHandler: { (_) in
            guard fie.text != nil else {
                return
            }
            try! Realm().write {
                node.nodeName = fie.text
            }
            self.selectSubNodes()
        }, cancleHandler: { (_) in
            
        })
    }
    
    func deleteAction(node: NodeMD){
        let lit = List<NodeMD>()
        lit.append(node)
        try? NodeDB.deleteNode(nodes: lit)
        self.selectSubNodes()
    }
    
}
