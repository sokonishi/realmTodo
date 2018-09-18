//
//  AddViewController.swift
//  RealmTodo
//
//  Created by 小西壮 on 2018/09/17.
//  Copyright © 2018年 小西壮. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tapButton: UIButton!
    var id = Int()
    
    //インスタンス化
    let todo = Todo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if id == Int() {
            tapButton.setTitle("add", for: .normal)
        } else {
            tapButton.setTitle("update", for: .normal)
            //返り値は変数に入れる時
            let selectedTodo = todo.getDate(id: id)
            textField.text! = selectedTodo.title
        }
    }

    @IBAction func tapButton(_ sender: UIButton) {
        
        //新規保存
        //realmを使う
        todo.create(title: textField.text!)
        
        //更新処理
        
        
        //navigationControllerを使った時に元の画面に戻る書き方
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
