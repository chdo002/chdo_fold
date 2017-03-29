
//
//  NodeMD.swift
//  chdo_fold
//
//  Created by chdo on 2017/3/14.
//  Copyright © 2017年 yw. All rights reserved.
//


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
