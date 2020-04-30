import UIKit

struct firstSectionInfomation {
    var namePerson1 : String
    var namePerson2 : String
    var changeTitle : String
    var changeBottomText : String
}

struct secondSectionInfomation {
    var startDate : String
    var startFromZero : Bool
    var showYearMonthDays : Bool
}

struct thirdSectionInfomation {
    var backgroundImage : String
}

struct fourthSectionInfomation {
    var nameTextColor : String
    var dayTextColor : String
    var barColor : String
    var language : String
    var showBottomBar : Bool
    var font : String
}

struct fifthSectionInfomation {
    var badge : Bool
    var usePasscodeLock : Bool
    var credits : String
    var purchaseAdfreeVersion : String
}
class SettingTableViewController: UIViewController {
    
    let numberOfSetion = 5
    var getchangeperson1: String = "Person 1"
    var getchangeperson2: String = ""
    var getchangetitle: String = ""
    var getchangebottom: String = ""

    enum Section {
        static let firstSection = (sectionIndex: 0, numberofRows: 4 )
        static let secondSection = (sectionIndex: 1, numberofRows: 3)
        static let thirdSection = (sectionIndex: 2, numberofRows: 1)
        static let fourthSection = (sectionIndex: 3, numberofRows: 6)
        static let fifthSection = (sectionIndex: 4, numberofRows: 4)
    }
    
    enum SpecialRow {
        static let startFromZero = 1
        static let showYearMonthDays = 2
        static let showBottomBar = 4
        static let badge = 0
        static let usePasscodeLock = 1
        static let purchaseAdfreeVersion = 3
    }
    
    enum Row {
        static let person1 = 0
        static let person2 = 1
        static let changeTitle = 2
        static let changeBottomText = 3
        static let startDate = 0
        static let backgroundImage = 0
        static let nameTextColor = 0
        static let dayTextColor = 1
        static let barColorr = 2
        static let language = 3
        static let font = 5
        static let credits = 2
    }
    
    @IBOutlet weak var settingTableView: UITableView!
    
    func firstSectionMapData (info: firstSectionInfomation) -> [firstSectionInfo] {
        return [.person1(name: info.namePerson1),
                .person2(name: info.namePerson2),
                .changeTitle(title: info.changeTitle),
                .changeBottomText(text: info.changeBottomText)]
    }
    
    func secondSectionMapData (info: secondSectionInfomation) -> [secondSectionInfo] {
        return [.startDate(date: info.startDate),
                .startfromZero(check: info.startFromZero),
                .showYearMonthDays(check: info.showYearMonthDays)]
    }
    
    func thirdSectionMapData (info: thirdSectionInfomation) -> [thirdSectionInfo] {
        return [.backgroundImage(image: info.backgroundImage)]
    }
    
    func fourthSectionMapData (info: fourthSectionInfomation) -> [fourthSectionInfo] {
        return [.nameTextColor(textcolor: info.nameTextColor),
                .dayTextColor(textcolor: info.dayTextColor),
                .barColor(barcolor: info.barColor),
                .language(language: info.language),
                .showBottomBar(show: info.showBottomBar),
                .font(font: info.font)]
    }
    
    func fifthSectionMapData (info: fifthSectionInfomation) -> [fifthSectionInfo] {
        return [.badge(badge: info.badge),
                .usePasscodeLock(lock: info.usePasscodeLock),
                .creadits(credits: info.credits),
                .purchaseAdfreeVersion(version: info.purchaseAdfreeVersion)]
    }
    
    let firstSectioninfo = firstSectionInfomation(namePerson1: "Person1",
                                                  namePerson2: "Person2",
                                                  changeTitle: "Been Together",
                                                  changeBottomText: "Today")
    let secondSectioninfo = secondSectionInfomation(startDate: "",
                                                    startFromZero: false,
                                                    showYearMonthDays: false)
    let thirdSectioninfo = thirdSectionInfomation(backgroundImage: "Change")
    let fourthSectioninfo = fourthSectionInfomation(nameTextColor: "Name Text Color",
                                                    dayTextColor: "Day Text Color",
                                                    barColor: "Bar Color",
                                                    language: "System Language",
                                                    showBottomBar: false, font: "")
    let fifthSectioninfo = fifthSectionInfomation(badge: false,
                                                  usePasscodeLock: false,
                                                  credits: "",
                                                  purchaseAdfreeVersion: "")
    
    var firstSectionInfoToCell = [firstSectionInfo]()
    var secondSectionInfoToCell = [secondSectionInfo]()
    var thirdSectionInfoToCell = [thirdSectionInfo]()
    var fourthSectionInfoToCell = [fourthSectionInfo]()
    var fifthSectionInfoToCell = [fifthSectionInfo]()
    var delegate: settingViewDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUp()
        firstSectionInfoToCell = firstSectionMapData(info: firstSectioninfo)
        secondSectionInfoToCell = secondSectionMapData(info: secondSectioninfo)
        thirdSectionInfoToCell = thirdSectionMapData(info: thirdSectioninfo)
        fourthSectionInfoToCell = fourthSectionMapData(info: fourthSectioninfo)
        fifthSectionInfoToCell = fifthSectionMapData(info: fifthSectioninfo)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handelBackView))
        settingTableView.reloadData()
    }
    
    @objc func handelBackView () {
        let Data = firstSectionInfomation(namePerson1: getchangeperson1 , namePerson2: getchangeperson2, changeTitle: getchangetitle, changeBottomText: getchangebottom)
        delegate?.passData(data: Data)
        print(Data.namePerson1)
        self.navigationController?.popViewController(animated: true)
    }
    
    func SetUp() {
        settingTableView.dataSource = self
        settingTableView.delegate = self
        settingTableView.register(UINib(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier: "infoTableViewCell")
        settingTableView.register(UINib(nibName: "SwitchTableViewCell", bundle: nil), forCellReuseIdentifier: "switchTableViewCell")
        settingTableView.register(UINib(nibName: "SimpleTableViewCell", bundle: nil), forCellReuseIdentifier: "simpleTableViewCell")
        settingTableView.register(UINib(nibName: "HeaderInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "headerInfoTableViewCell")
    }
    
}

extension SettingTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == Section.firstSection.sectionIndex {
            return fifthSectionInfoToCell.count
        }
        if section == Section.secondSection.sectionIndex {
            return secondSectionInfoToCell.count
        }
        if section == Section.thirdSection.sectionIndex {
            return thirdSectionInfoToCell.count
        }
        if section == Section.fourthSection.sectionIndex {
            return fourthSectionInfoToCell.count
        }
        if section == Section.fifthSection.sectionIndex {
            return fifthSectionInfoToCell.count
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSetion
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == Section.firstSection.sectionIndex {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "infoTableViewCell") as? InfoTableViewCell else {
                return UITableViewCell()
            }
            cell.firstSectionSetContentForCell(info: firstSectionInfoToCell[indexPath.row])
            return cell
        }
        if indexPath.section == Section.secondSection.sectionIndex {
            if indexPath.row != SpecialRow.startFromZero && indexPath.row != SpecialRow.showYearMonthDays {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "infoTableViewCell") as? InfoTableViewCell else {
                    return UITableViewCell()
                }
                cell.secondSectionSetContentForCell(info:  secondSectionInfoToCell[indexPath.row])
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "switchTableViewCell") as? SwitchTableViewCell else {
                    return UITableViewCell()
                }
                cell.secondSectionSetContentForCell(info: secondSectionInfoToCell[indexPath.row])
                return cell
            }
        }
        if indexPath.section == Section.thirdSection.sectionIndex {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "infoTableViewCell") as? InfoTableViewCell else {
                return UITableViewCell()
            }
            cell.thirdSectionSetContentForCell(info: thirdSectionInfoToCell[indexPath.row])
            return cell
        }
        if indexPath.section == Section.fourthSection.sectionIndex {
            if indexPath.row != SpecialRow.showBottomBar {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "infoTableViewCell") as? InfoTableViewCell else {
                    return UITableViewCell()
                }
                cell.fourthSectionSetContentForCell(info: fourthSectionInfoToCell[indexPath.row])
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "switchTableViewCell") as? SwitchTableViewCell else {
                    return UITableViewCell()
                }
                cell.fourthSectionSetContentForCell(info: fourthSectionInfoToCell[indexPath.row])
                return cell
            }
        }
        if indexPath.section == Section.fifthSection.sectionIndex {
            if indexPath.row == SpecialRow.badge || indexPath.row == SpecialRow.usePasscodeLock {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "switchTableViewCell") as? SwitchTableViewCell else {
                    return UITableViewCell()
                }
                cell.fifthSectionSetContentForCell(info: fifthSectionInfoToCell[indexPath.row])
                return cell
            } else if indexPath.row == SpecialRow.purchaseAdfreeVersion {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "simpleTableViewCell") as? SimpleTableViewCell else {
                    return UITableViewCell()
                }
                cell.fifthSectionSetContentForCell(info: fifthSectionInfoToCell[indexPath.row])
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "infoTableViewCell") as? InfoTableViewCell else {
                    return UITableViewCell()
                }
                cell.fifthSectionSetContentForCell(info: fifthSectionInfoToCell[indexPath.row])
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == Name.name.section {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "headerInfoTableViewCell") as? HeaderInfoTableViewCell else {
                return UITableViewCell()
            }
            cell.setTitleHeaderCell(title: Name.name.nameTitle)
            return cell
        }
        if section == Name.backgroundImage.section {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "headerInfoTableViewCell") as? HeaderInfoTableViewCell else {
                return UITableViewCell()
            }
            cell.setTitleHeaderCell(title: Name.backgroundImage.nameTitle)
            return cell
        }
        if section == Name.dateSettings.section {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "headerInfoTableViewCell") as? HeaderInfoTableViewCell else {
                return UITableViewCell()
            }
            cell.setTitleHeaderCell(title: Name.dateSettings.nameTitle)
            return cell
        }
        if section == Name.disPlay.section {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "headerInfoTableViewCell") as? HeaderInfoTableViewCell else {
                return UITableViewCell()
            }
            cell.setTitleHeaderCell(title: Name.disPlay.nameTitle)
            return cell
        }
        if section == Name.appSettings.section {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "headerInfoTableViewCell") as? HeaderInfoTableViewCell else {
                return UITableViewCell()
            }
            cell.setTitleHeaderCell(title: Name.appSettings.nameTitle)
            return cell
        }
        return UITableViewCell()
    }
    
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == Section.firstSection.sectionIndex {
            if indexPath.row == Row.person1 {
                let alert:UIAlertController = UIAlertController(title: "Person 1 Name", message: "", preferredStyle: .alert)
                alert.addTextField { (txtperson1) in
                    txtperson1.placeholder = "New Name Person 1"
                }
                alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: { (changePerson1) in
                    let nameperson1: String = (alert.textFields?[0].text!)!
                    self.getchangeperson1 = nameperson1
                }))
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                present(alert,animated: true, completion: nil)
            }
            if indexPath.row == Row.person2 {
                let alert:UIAlertController = UIAlertController(title: "Person 2 Name", message: "", preferredStyle: .alert)
                alert.addTextField { (txtperson1) in
                    txtperson1.placeholder = "New Name Person 2"
                }
                alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: { (changePerson1) in
                    let nameperson2: String = (alert.textFields?[0].text!)!
                    self.getchangeperson2 = nameperson2
                }))
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                present(alert,animated: true, completion: nil)
            }
            if indexPath.row == Row.changeTitle {
                let alert:UIAlertController = UIAlertController(title: "Change Title", message: "", preferredStyle: .alert)
                alert.addTextField { (txtperson1) in
                    txtperson1.placeholder = "New Title"
                }
                alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: { (changePerson1) in
                    let title: String = (alert.textFields?[0].text!)!
                    self.getchangetitle = title
                }))
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                present(alert,animated: true, completion: nil)
            }
            if indexPath.row == Row.changeBottomText {
                let alert:UIAlertController = UIAlertController(title: "Change Bottom text", message: "", preferredStyle: .alert)
                alert.addTextField { (bottom) in
                    bottom.placeholder = "New Bottom text"
                }
                alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: { (changePerson1) in
                    let bottom: String = (alert.textFields?[0].text!)!
                    self.getchangebottom = bottom
                }))
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                present(alert,animated: true, completion: nil)
            }
        }
        
        if indexPath.section == Section.secondSection.sectionIndex {
            if indexPath.row == Row.startDate {
                
            }
        }
        
        if indexPath.section == Section.thirdSection.sectionIndex {
            
        }
        
        if indexPath.section == Section.fourthSection.sectionIndex {
            if indexPath.row == Row.nameTextColor {
                
            }
            if indexPath.row == Row.dayTextColor {
                
            }
            if indexPath.row == Row.barColorr {
                
            }
            if indexPath.row == Row.language {
                
            }
            if indexPath.row == Row.font {
                
            }
        }
        
        if indexPath.section == Section.thirdSection.sectionIndex {
            if indexPath.row == Row.credits {
                
            }
            if indexPath.row == SpecialRow.purchaseAdfreeVersion {
                
            }
        }
    }
    
   
}

extension SettingTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}

protocol settingViewDelegate {
    func passData(data : firstSectionInfomation)
}
