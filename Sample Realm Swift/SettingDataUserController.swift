//
//  SettingDataUserController.swift
//  Sample SQLite Swift
//
//  Created by Rahmat Hidayat on 7/26/18.
//  Copyright © 2018 Rahmat Hidayat. All rights reserved.
//

import UIKit
import RealmSwift

class SettingDataUserController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnProcess: UIButton!
    
    var isEdit: Bool! //False: Form Add, True: Form Edit
    var idUser: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnProcess.layer.cornerRadius = 4
        
        if self.isEdit {
            if let user = try! Realm().objects(users.self).filter("id == %@", self.idUser).first {
                self.txtName.text = user.name
                self.txtEmail.text = user.email
            }
            self.btnProcess.setTitle("Edit", for: .normal)
        }else{
            self.btnProcess.setTitle("Save", for: .normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnProcessTapped(_ sender: UIButton) {
        if self.isEdit {
            if let user = try! Realm().objects(users.self).filter("id == %@", self.idUser).first {
                try! Realm().write {
                    user.name = self.txtName.text!
                    user.email = self.txtEmail.text!
                }
                self.performSegue(withIdentifier: "backToListData", sender: self)
            }
        }else{            
            let user = users()
            user.id = (try! Realm().objects(users.self).max(ofProperty: "id") as Int? ?? 0) + 1 //Autoincrement
            user.name = self.txtName.text!
            user.email = self.txtEmail.text!
            DBHelper.insert(user)
            self.performSegue(withIdentifier: "backToListData", sender: self)
        }
    }
}
