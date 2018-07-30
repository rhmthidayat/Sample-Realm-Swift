//
//  LoginController.swift
//  Sample Realm Swift
//
//  Created by Rahmat Hidayat on 7/27/18.
//  Copyright © 2018 Rahmat Hidayat. All rights reserved.
//

import UIKit
import RealmSwift

class LoginController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnLogin.layer.cornerRadius = 4        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnLoginTapped(_ sender: UIButton) {
        let filter = try! Realm().objects(users.self).filter("email == %@ && password == %@", self.txtEmail.text!, self.txtPassword.text!)
        if filter.count > 0 {
            if let login = try! Realm().objects(userLogin.self).first {
                try! Realm().write {
                    login.loginId = filter.first!.id
                    login.isLogin = true
                }
            }else{
                let login = userLogin()
                login.loginId = filter.first!.id
                login.isLogin = true
                DBHelper.insert(login)
            }
            self.performSegue(withIdentifier: "showHome", sender: self)
        }else{
            self.showAlert("Email and Password Mismatch")
        }
    }
    
    func showAlert(_ msg: String){
        let alert = UIAlertController(title: "Oops", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in }))
        self.present(alert, animated: true, completion: nil)
    }
}
