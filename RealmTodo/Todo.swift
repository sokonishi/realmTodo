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
        
        //データベースから情報取得
        let list = realm.objects(Todo.self)
        
        //配列に入れる
        for value in list {
            let todo = ["id": value.id, "title": value.title, "date": value.date] as NSDictionary
            
            self.list.append(todo)
        }
    }
    
    //特定のデータのみ取得
    //-> Todoみたいな戻り値がある時は受け取る側でletで定義してあげる
    func getDate(id: Int) -> Todo {
        
        //DB接続
        let realm = try! Realm()
        
        //データを取得
        let todo = realm.objects(Todo.self).filter("id = \(id)").first
        
        //取得したデータを返す
        return todo!
    }
    
    //更新
    func update(id: Int,title: String) {
        let realm = try! Realm()
        
        let todo = realm.objects(Todo.self).filter("id = \(id)").first
        
        //更新する時
        try! realm.write {
            todo!.title = title
        }
        
    }
    
    //削除
    func delete(id: Int) {
        //DBに接続
        let realm = try! Realm()
        
        //削除するデータを取得
        //.filter("id = 1").firstで条件を絞る.firstは１こ目を取ってくる、実際は無くていい
        let todo = realm.objects(Todo.self).filter("id = \(id)").first
        
        //取得したデータを削除する
        try! realm.write {
            realm.delete(todo!)
        }
    }
    
    
}
