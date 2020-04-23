//
//  MenuTableViewController.swift
//  BeenTogether
//
//  Created by namtrinh on 4/16/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import UIKit

enum MenuType: Int {
    case BeenTogether
    case CalculateDate
    case Themes
    case GetFreePhotobook
}

class MenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else {return}
        dismiss(animated: true) {
            print("Dismissing:\(menuType)")
        }
            
    }

}
