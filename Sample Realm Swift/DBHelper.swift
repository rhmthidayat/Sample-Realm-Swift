//
//  DBHelper.swift
//  Sample Realm Swift
//
//  Created by mac on 7/27/18.
//  Copyright © 2018 Rahmat. All rights reserved.
//

import RealmSwift

struct DBHelper {
    
    // Insert
    static func insert(_ obj: Object){
        try! Realm().write({
            try! Realm().add(obj)
        })
    }
    
    // Read
    static func getAllUsers() -> [users]{
        let objs: Results<users> = {
           try! Realm().objects(users.self)
        }()
        return Array(objs)
    }    
    
    // Delete
    static func deleteUserById(_ id: Int){
        let obj = try! Realm().objects(users.self).filter("id == %@", id)
        try! Realm().write({
            try! Realm().delete(obj)
        })
    }
}
