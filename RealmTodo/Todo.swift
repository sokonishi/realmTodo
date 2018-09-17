//
//  Todo.swift
//  RealmTodo
//
//  Created by 小西壮 on 2018/09/17.
//  Copyright © 2018年 小西壮. All rights reserved.
//

import Foundation
import RealmSwift

//データの新規登録、所得、更新、削除を担当するClassを作成
//class Todo: Objectを使う為にRealmSwiftを使う
class Todo: Object{
    
    //カラム名を決める
    @objc dynamic var id = Int()
    @objc dynamic var title = String()
    @objc dynamic var date = String()
    
    //tableViewに表示させる為に書いてる
    var list = [NSDictionary]()
    
    //新規登録
    func create(title: String) {
        //データベース接続
        let realm = try! Realm()
        
        //データの書き込み
        try! realm.write{
            
            //インスタンス化
            let todo = Todo()
            //日付指定
            let now = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd"
            
            //AutoInpriment
            todo.id = (realm.objects(Todo.self).max(ofProperty: "id") as Int? ?? 0) + 1
            
            //ユーザーが書いたものを入れる
            todo.title = title
            
            //日付のフォーマット
            todo.date = formatter.string(from: now as Date)
            
            //データベースに追加
            realm.add(todo)
            
        }
    }
    
    //取得
    func getAll() {
        let realm = try! Realm()
        
        let list = realm.objects(Todo.self)
        
        for value in list {
            let todo = ["id": value.id, "title": value.title, "date": value.date] as NSDictionary
            
            self.list.append(todo)
        }
    }
    
    //更新
    
    //削除
    
}
