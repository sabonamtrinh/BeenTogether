//
//  SwitchTableViewCell.swift
//  BeenTogether
//
//  Created by namtrinh on 4/21/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
        
    func secondSectionSetContentForCell (info: secondSectionInfo) {
        switch info {
        case .startfromZero(check: _):
            titleLabel.text = secondSectionTitleCell.startFromZero
        case .showYearMonthDays(check: _):
            titleLabel.text = secondSectionTitleCell.showYearMonthDays
        default:
            break
        }
    }
    
    func fourthSectionSetContentForCell (info: fourthSectionInfo) {
        switch info {
        case .showBottomBar(show: _):
            titleLabel.text = fourthSectionTitleCell.showBottomBar
        default:
            break
        }
    }
    
    func fifthSectionSetContentForCell (info: fifthSectionInfo) {
        switch info {
        case .badge(badge: _):
            titleLabel.text = fifthSectionIitleCell.badge
        case .usePasscodeLock(lock: _):
            titleLabel.text = fifthSectionIitleCell.usePasscodeLock
        default :
            break
        }
    }
    
    }

