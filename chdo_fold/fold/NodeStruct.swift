
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
    
    var subNode : Results<NodeMD>!
    var folds   = [NodeMD]()
    var files   = [NodeMD]()
    
    init(nodes: Results<NodeMD>) {
        for nd in nodes {
            if nd.nodeType.isFold {
                folds.append(nd)
            } else{
                files.append(nd)
            }
        }
        self.subNode = nodes
    }
}
