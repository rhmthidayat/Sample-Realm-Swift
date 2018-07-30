//
//  Model.swift
//  Sample Realm Swift
//
//  Created by Rahmat Hidayat on 7/27/18.
//  Copyright © 2018 Rahmat Hidayat. All rights reserved.
//

import UIKit
import RealmSwift

class users: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var email = ""
    @objc dynamic var password = ""
}

class userLogin: Object {
    @objc dynamic var loginId = 0
    @objc dynamic var isLogin = false
}
