
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
        
        // 设置根目录
        let rel = try? Realm()
        try rel?.write {
            rel?.add(node, update: true)
        }
    }
}



class NodeViewModel {
        
}
