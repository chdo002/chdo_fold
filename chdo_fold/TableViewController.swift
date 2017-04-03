//
//  TableViewController.swift
//  chdo_fold
//
//  Created by chdo on 2017/3/14.
//  Copyright © 2017年 yw. All rights reserved.
//

import UIKit


import RealmSwift

class TableViewController: UITableViewController {

    // 当前目录节点
    var currentNode: NodeMD? {
        didSet{
            self.selectSubNodes()
        }
    }
    
    // 当前目录结构
    var nodes: NodeStruct!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = currentNode?.nodeName
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    // 获取本地子节点
    func selectSubNodes(){
        let relm = try! Realm()
        var parentID = "root"
        if let id = currentNode?.parentNodeID {
            parentID = id
        }
        let subNodes = relm.objects(NodeMD.self).filter("parentNodeID = %@", parentID)
        self.nodes = NodeStruct(nodes: subNodes)
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int { return 2 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if nodes == nil {
            return 0
        } else {
            if section == 0 {
                return nodes.folds.count
            } else {
                return nodes.files.count
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "fold")
            cell.textLabel?.text = nodes.folds[indexPath.row].nodeName
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "file")
            cell.textLabel?.text = nodes.files[indexPath.row].nodeName
        }
        return cell
    }
    
    @IBAction func editAction(_ sender: UIBarButtonItem) {
        
        UIHelper.showActionSheet("add new node", viewcontroller: self, actions:
            ("addFold", {_ in
            self.insertNewfold()
        }), ("addFile", {_ in
            self.insertNewfile()
        }))
    }
    
    
}
