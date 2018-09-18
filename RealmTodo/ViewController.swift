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
        //一旦初期化
        todo.list.removeAll()
        //取得
        todo.getAll()
        //アップデート
        tableView.reloadData()
        
    }
    
    //行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //todo.listの中の数
        return todo.list.count
        //print(todo.list)
        
    }
    
    //セルの中身を決める
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = todo.list[indexPath.row]["title"] as? String
        
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        //左スライドの処理
        if editingStyle == .delete {
            
            //databaseから削除するデータを指定する為に書いている
            let id = todo.list[indexPath.row]["id"] as! Int
            
            //DBから削除する
            todo.delete(id: id)
            
            //画面からtodoを消している(databaseはまだ)
            //配列から消す
            todo.list.remove(at: indexPath.row)
            //画面から消す
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        
    }
}

