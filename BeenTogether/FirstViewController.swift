//
//  ViewController.swift
//  BeenTogether
//
//  Created by namtrinh on 4/8/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var getDayLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    var getday = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let realDay = getCurentDateTime()
        let endDate = datePicker.date
        let startdate = dateFormatter.date(from: realDay)
        let days = daysBetween(endDate, startdate!)
        getday = String(days)
        getDayLabel.text = String(days)+"days"
    }
    
    @IBAction func handelGetStartedButton(_ sender: Any) {
        let scr = storyboard?.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
        scr.day =  getday + "days"
        navigationController?.pushViewController(scr, animated: true)
        //present(scr, animated: true, completion: nil)
    }
    
    func getCurentDateTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let str = formatter.string(from: Date())
        return str
    }
    
    public func daysBetween(_ start: Date,_ end: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: start, to: end).day!
    }
    
}

