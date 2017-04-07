
//
//  NodeStruct.swift
//  chdo_fold
//
//  Created by chdo on 2017/3/14.
//  Copyright © 2017年 yw. All rights reserved.
//

import Foundation
import RealmSwift

struct NodeStruct {
    
    var subNode : Results<NodeMD>?

    var folds = [NodeMD]()
    var files = [NodeMD]()
    
    init(currentNode: NodeMD?) {
        
        let relm = try! Realm()
        var parentID = "root"
        if let id = currentNode?.id {
            parentID = id
        }
        
        self.subNode = relm.objects(NodeMD.self).filter("parentNodeID = %@", parentID)
        
        for nd in subNode! {
            if nd.nodeType.isFold {
                folds.append(nd)
            } else {
                files.append(nd)
            }
        }
//        folds   = relm.objects(NodeMD.self).filter("parentNodeID = %@ and nodeType = 0", parentID)
//        files   = relm.objects(NodeMD.self).filter("parentNodeID = %@ and nodeType = 1", parentID)
        
    }
    
}
