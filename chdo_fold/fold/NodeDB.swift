
//
//  NodeDB.swift
//  chdo_fold
//
//  Created by chdo on 2017/3/23.
//  Copyright © 2017年 yw. All rights reserved.
//

import RealmSwift
import Changeset

class NodeDB {
    
    static func saveNode(node: NodeMD) throws {    
        
        let rel = try? Realm()
        
        try rel?.write {
            rel?.add(node, update: true)
        }
    }
    
    static func deleteNode(nodes: List<NodeMD>) throws {
        let rel = try? Realm()
        try rel?.write {
            rel?.delete(nodes)
        }
    }
    

    
}



class NodeViewModel {
        
}
