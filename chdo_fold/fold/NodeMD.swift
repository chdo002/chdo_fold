
//
//  NodeMD.swift
//  chdo_fold
//
//  Created by chdo on 2017/3/14.
//  Copyright © 2017年 yw. All rights reserved.
//


import RealmSwift

class NodeMD: Object {
    
    dynamic var id: String?
    dynamic var nodeName: String?
    dynamic var parentNodeID: String?
    dynamic var createTimeStamp: String?
    dynamic var nodeType: Int8 = NodeType.fold.rawValue
    
//    dynamic var 
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

public enum NodeType: Int8 {
    case fold = 0
    case file = 1
    
    func tyoeImage() -> UIImage{
        switch self {
        case .file:
            return #imageLiteral(resourceName: "file")
        default:
            return #imageLiteral(resourceName: "fold")
        }
    }
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
