//
//  ProfileController.swift
//  Sample SQLite Swift
//
//  Created by Rahmat Hidayat on 7/26/18.
//  Copyright © 2018 Rahmat Hidayat. All rights reserved.
//

import UIKit
import RealmSwift

class ProfileController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var btnLogout: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnLogout.layer.cornerRadius = 4
        if let login = try! Realm().objects(userLogin.self).first,
            let user = try! Realm().objects(users.self).filter("id == %@", login.loginId).first
        {
            self.lblName.text = user.name
            self.lblEmail.text = user.email
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    @IBAction func btnLogoutTapped(_ sender: UIButton) {
        if let login = try! Realm().objects(userLogin.self).first {
            try! Realm().write {
                login.loginId = 0
                login.isLogin = false
            }
        }
        let login = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "showLogin") as! LoginController
        self.present(login, animated: true, completion: nil)
    }
}
