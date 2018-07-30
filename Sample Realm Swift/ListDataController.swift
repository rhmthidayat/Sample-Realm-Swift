//
//  ListDataController.swift
//  Sample Realm Swift
//
//  Created by mac on 7/27/18.
//  Copyright © 2018 Rahmat. All rights reserved.
//

import UIKit
import RealmSwift

class ListDataController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tbData: UITableView!
    
    var listUser: [users]!
    var idUserSelected: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tbData.delegate = self
        self.tbData.dataSource = self
        self.tbData.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let user = DBHelper.getAllUsers()
        self.listUser = user
        self.tbData.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! ListDataCell
        
        let data = self.listUser[indexPath.row]
        cell.lblName.text = data.name
        cell.lblEmail.text = data.email
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.idUserSelected = self.listUser[indexPath.row].id
        self.performSegue(withIdentifier: "showDetailData", sender: self)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { (_, index) in
            DBHelper.deleteUserById(self.listUser[indexPath.row].id)
        }
        delete.backgroundColor = UIColor.red
        
        return [delete]
    }
    
    @IBAction func btnAddTapped(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "showAddData", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailData" {
            let conn = segue.destination as! DetailDataController
            conn.idUser = self.idUserSelected
        }
        if segue.identifier == "showAddData" {
            let conn = segue.destination as! SettingDataUserController
            conn.isEdit = false
        }
    }
    
    @IBAction func backToListData(_ sender: UIStoryboardSegue){}
}
