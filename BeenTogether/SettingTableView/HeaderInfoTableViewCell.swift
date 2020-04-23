//
//  HeaderInfoTableViewCell.swift
//  BeenTogether
//
//  Created by namtrinh on 4/21/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import UIKit
 
enum Name {
    static let name = (section: 0, nameTitle: "Name")
    static let dateSettings = (section: 1, nameTitle: "Date Settings")
    static let backgroundImage = (section: 2, nameTitle: "Background Image")
    static let disPlay = (section: 3, nameTitle: "Display")
    static let appSettings = (section: 4, nameTitle: "App Settings")
}
class HeaderInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setTitleHeaderCell(title: String) {
        headerLabel.text = title
    }
}
