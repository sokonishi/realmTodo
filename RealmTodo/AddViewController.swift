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
    
    //インスタンス化
    let todo = Todo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapButton(_ sender: UIButton) {
        
        //新規保存
        //realmを使う
        todo.create(title: textField.text!)
        
        //navigationControllerを使った時に元の画面に戻る書き方
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
