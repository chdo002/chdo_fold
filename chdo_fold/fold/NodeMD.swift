
//
//  NodeMD.swift
//  chdo_fold
//
//  Created by chdo on 2017/3/14.
//  Copyright © 2017年 yw. All rights reserved.
//

import Foundation
import RealmSwift



class NodeMD: Object {
    
    var id: String?
    var nodeName: String?
    var parentNodeID: String?
    var createTimeStamp: String?
    var nodeType: Int8 = NodeType.fold.rawValue
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
