//
//  RegisterController.swift
//  Sample Realm Swift
//
//  Created by Rahmat Hidayat on 7/27/18.
//  Copyright © 2018 Rahmat Hidayat. All rights reserved.
//

import UIKit
import RealmSwift

class RegisterController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnRegister.layer.cornerRadius = 4
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func btnRegisterTapped(_ sender: UIButton) {
        self.register()
    }
    
    func register(){
        // Register/Insert to Database
        let data = users()
        let id = (try! Realm().objects(users.self).max(ofProperty: "id") as Int? ?? 0) + 1 //Autoincrement
        data.id = id
        data.name = self.txtName.text!
        data.email = self.txtEmail.text!
        data.password = self.txtPassword.text!
        DBHelper.insert(data)
        
        // Login
        if let login = try! Realm().objects(userLogin.self).first {
            try! Realm().write {
                login.loginId = id
                login.isLogin = true
            }
        }else{
            let login = userLogin()
            login.loginId = id
            login.isLogin = true
            DBHelper.insert(login)
        }
        self.performSegue(withIdentifier: "showHome", sender: self)
    }
    
    @IBAction func btnLoginTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
