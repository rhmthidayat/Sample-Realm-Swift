//
//  ListDataCell.swift
//  Sample SQLite Swift
//
//  Created by Rahmat Hidayat on 7/26/18.
//  Copyright © 2018 Rahmat Hidayat. All rights reserved.
//

import UIKit

class ListDataCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
