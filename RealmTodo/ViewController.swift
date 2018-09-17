//
//  ViewController.swift
//  RealmTodo
//
//  Created by 小西壮 on 2018/09/17.
//  Copyright © 2018年 小西壮. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let todo = Todo()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //一覧表示
        todo.list.removeAll()
        todo.getAll()
        tableView.reloadData()
        
    }
    
    //行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //todo.listの中の数
        return todo.list.count
        
    }
    
    //セルの中身を決める
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = todo.list[indexPath.row]["title"] as? String
        
        return cell
    }

}

