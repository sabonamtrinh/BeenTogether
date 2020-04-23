

import UIKit

enum firstSectionTitleCell {
    static let person1 = "Person 1"
    static let person2 = "Person 2"
    static let changetitle = "Change Title"
    static let changeBottomText = "Change Bottom text"
}

enum firstSectionInfo {
    case person1(name: String)
    case person2(name: String)
    case changeTitle(title: String)
    case changeBottomText(text :String)
}

enum secondSectionTitleCell {
    static let startDate = "Start date"
    static let startFromZero = "Start from Zero"
    static let showYearMonthDays = "Show Year,Month,Days"

}

enum secondSectionInfo {
    case startDate(date: String)
    case startfromZero(check: Bool)
    case showYearMonthDays(check: Bool)
}

enum thirdSectionTitleCell {
    static let backgroundImage = "Background Image"
}

enum thirdSectionInfo {
    case backgroundImage(image: String)
}

enum fourthSectionTitleCell {
    static let nameTextColor = "Name Text Color"
    static let dayTextColor = "Day Text Color"
    static let barColor = "Bar Color"
    static let language = "Language"
    static let showBottomBar = "Show Bottom Bar"
    static let font = "Font"
}

enum fourthSectionInfo {
    case nameTextColor(textcolor: String)
    case dayTextColor(textcolor: String)
    case barColor(barcolor: String)
    case language(language: String)
    case showBottomBar(show: Bool)
    case font(font: String)
}

enum fifthSectionIitleCell {
    static let badge = "Badge"
    static let usePasscodeLock = "Use passcode lock"
    static let credits = "Credits"
    static let purchaseAdfreeVersion = "Purchase Ad-free version"
}

enum fifthSectionInfo {
    case badge(badge: Bool)
    case usePasscodeLock(lock: Bool)
    case creadits(credits: String)
    case purchaseAdfreeVersion(version: String)
}


class InfoTableViewCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var infoLabel: UILabel!
    
    func firstSectionSetContentForCell(info: firstSectionInfo){
        switch info {
        case .person1(name: let name):
            titleLabel.text = firstSectionTitleCell.person1
            infoLabel.text = name
        case .person2(let name):
            titleLabel.text = firstSectionTitleCell.person2
            infoLabel.text = name
        case .changeTitle(let title):
            titleLabel.text = firstSectionTitleCell.changetitle
            infoLabel.text = title
        case .changeBottomText(let text):
            titleLabel.text = firstSectionTitleCell.changeBottomText
            infoLabel.text = text
        }
        
    }
    func secondSectionSetContentForCell(info: secondSectionInfo){
        switch info {
        case .startDate(let date):
            titleLabel.text = secondSectionTitleCell.startDate
            infoLabel.text = date
        case .startfromZero(check: _):
            break
        case .showYearMonthDays(check: _):
            break
        }
    }
    
    func thirdSectionSetContentForCell (info: thirdSectionInfo){
        switch info {
        case .backgroundImage(let image):
            titleLabel.text = thirdSectionTitleCell.backgroundImage
            infoLabel.text = image
        }
    }
    
    func fourthSectionSetContentForCell (info: fourthSectionInfo){
        switch info {
        case .nameTextColor(let textcolor):
            titleLabel.text = fourthSectionTitleCell.nameTextColor
            infoLabel.text = textcolor
        case .dayTextColor(let textcolor):
            titleLabel.text = fourthSectionTitleCell.dayTextColor
            infoLabel.text = textcolor
        case .barColor(let barcolor):
            titleLabel.text = fourthSectionTitleCell.barColor
            infoLabel.text = barcolor
        case .language(let language):
            titleLabel.text = fourthSectionTitleCell.language
            infoLabel.text = language
        case .showBottomBar(show: _):
            break
        case .font(let font):
            titleLabel.text = fourthSectionTitleCell.font
            infoLabel.text = font
        }
    }
    
    func fifthSectionSetContentForCell (info: fifthSectionInfo) {
        switch info {
        case .badge(badge: _):
            break
        case .usePasscodeLock(lock: _):
            break
        case .creadits(let credits):
            titleLabel.text = fifthSectionIitleCell.credits
            infoLabel.text = credits
        case .purchaseAdfreeVersion(version: _):
            break
        }
    }

    
    
}
