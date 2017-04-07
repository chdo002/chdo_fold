//
//  TableViewController.swift
//  chdo_fold
//
//  Created by chdo on 2017/3/14.
//  Copyright © 2017年 yw. All rights reserved.
//

import UIKit


import RealmSwift

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!
    
    // 当前目录节点
    var currentNode: NodeMD? {
        didSet{
            self.selectSubNodes()
        }
    }
    
    // 当前目录结构
    var nodes: NodeStruct! {
        didSet {
            self.tableView?.reloadData()
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.tableView = UITableView(frame: self.view.bounds)
        self.tableView.backgroundColor = UIColor.white
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let addButton = UIBarButtonItem(title: "添加节点", style: .done, target: self, action: #selector(editAction))
        self.navigationItem.setRightBarButton(addButton, animated: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        if let indexs = self.tableView.indexPathsForSelectedRows {
            for ind in indexs {
                self.tableView.deselectRow(at: ind, animated: true)
            }
        }
    }
    
    func refresh() {
        self.selectSubNodes()
        self.tableView.reloadData()
    }

    // 获取本地子节点
    func selectSubNodes(){
        self.title = currentNode?.nodeName
        self.nodes = NodeStruct(currentNode: self.currentNode)
    }

    func numberOfSections(in tableView: UITableView) -> Int { return 2 }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            cell?.backgroundColor = UIColor.white
        
        if indexPath.section == 0 {
            let node = nodes.folds[indexPath.row]
            cell?.textLabel?.text = node.nodeName
            cell?.imageView?.image = node.nodeType.nodeType.tyoeImage()
        } else {
            let node = nodes.files[indexPath.row]
            cell?.textLabel?.text = node.nodeName
            cell?.imageView?.image = node.nodeType.nodeType.tyoeImage()
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
        if indexPath.section == 0 {
            let node = self.nodes.folds[indexPath.row]
            let vc = TableViewController()
            vc.currentNode = node
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            self.tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func editAction() {
        
        UIHelper.showActionSheet("add new node", viewcontroller: self, actions:
            ("addFold", {_ in
            self.insertNewfold()
        }), ("addFile", {_ in
            self.insertNewfile()
        }))
    }
    
    
    // 添加文件夹
    func insertNewfold(){
        
        let newFold = NodeMD()
        newFold.parentNodeID = self.currentNode?.id
        newFold.id = Date.timeStamp()
        newFold.nodeType = NodeType.fold.rawValue

        var textfield: UITextField!
        UIHelper.showTextAlert("Input Fold nmae", viewcontroller: self, textfieldHandler: { (field) in
            textfield = field
        }, comfireHandler: { (_) in
            
            if textfield.text == nil || textfield.text == "" {
                return
            }
            newFold.nodeName = textfield.text
            newFold.createTimeStamp = Date.timeStamp()
            do {
                try NodeDB.saveNode(node: newFold)
                self.selectSubNodes()
            } catch let err {
                print(err.localizedDescription)
            }
            
        }) { (_) in
            
        }
    }
    
    // 添加文件
    func insertNewfile(){
        
        let newFold = NodeMD()
        newFold.parentNodeID = self.currentNode?.id
        newFold.id = Date.timeStamp()
        newFold.nodeType = NodeType.file.rawValue

        var textfield: UITextField!
        UIHelper.showTextAlert("Input File nmae", viewcontroller: self, textfieldHandler: { (field) in
            textfield = field
        }, comfireHandler: { (_) in
            newFold.nodeName = textfield.text
            newFold.createTimeStamp = Date.timeStamp()
            do {
                try NodeDB.saveNode(node: newFold)
                self.selectSubNodes()
            } catch let err {
                print(err.localizedDescription)
            }
            
        }) { (_) in
            
        }
    }

    
}
