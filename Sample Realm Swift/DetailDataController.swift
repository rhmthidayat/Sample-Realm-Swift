//
//  DetailDataController.swift
//  Sample SQLite Swift
//
//  Created by mac on 7/26/18.
//  Copyright © 2018 Rahmat. All rights reserved.
//

import UIKit
import RealmSwift

class DetailDataController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    var idUser: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let user = try! Realm().objects(users.self).filter("id == %@", self.idUser).first {
            self.lblName.text = user.name
            self.lblEmail.text = user.email
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func btnEditTapped(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "showEditData", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEditData" {
            let conn = segue.destination as! SettingDataUserController
            conn.idUser = self.idUser
            conn.isEdit = true
        }
    }
    
}
