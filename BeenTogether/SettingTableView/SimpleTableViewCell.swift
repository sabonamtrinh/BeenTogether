//
//  SimpleTableViewCell.swift
//  BeenTogether
//
//  Created by namtrinh on 4/23/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import UIKit

class SimpleTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    
    func fifthSectionSetContentForCell (info: fifthSectionInfo) {
        switch info {
        case .purchaseAdfreeVersion(version: _):
            titleLabel.text = fifthSectionIitleCell.purchaseAdfreeVersion
        default:
            break
        }
    }
    
}
