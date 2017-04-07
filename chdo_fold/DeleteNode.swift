//
//  DeleteNode.swift
//  chdo_fold
//
//  Created by chdo on 2017/4/7.
//  Copyright © 2017年 yw. All rights reserved.
//

import UIKit
import RealmSwift

extension TableViewController {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        var node: NodeMD!
        if indexPath.section == 0 {
            node = self.nodes.folds[indexPath.row]
        } else if indexPath.section == 1 {
            node = self.nodes.files[indexPath.row]
        }
    
        var lit = List<NodeMD>()
        lit.append(contentsOf: [node])
        
        try? NodeDB.deleteNode(nodes: lit)
        self.selectSubNodes()
    }

}
