//
//  SecondViewController.swift
//  BeenTogether
//
//  Created by namtrinh on 4/8/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var backgroudImageView: UIImageView!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var titleBtn: UIButton!
    @IBOutlet weak var bottomBtn: UIButton!
    @IBOutlet weak var person1Btn: UIButton!
    @IBOutlet weak var person2Btn: UIButton!
    @IBOutlet weak var changeNamePerson1Btn: UIButton!
    @IBOutlet weak var changeNamePerson2Btn: UIButton!
    
    let transition = SlideInTransition()
    var count = 0
    var day = ""
    
    var data = [firstSectionInfomation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        daysLabel.text = day
        customButton()
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func handelTogetherButton(_ sender: Any) {
        let alert:UIAlertController = UIAlertController(title: "Change Title", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addTextField { (txtTitle) in
            txtTitle.placeholder = "New Title"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .destructive) { (getTitle) in
            let title:String = (alert.textFields?[0].text!)!
            self.titleBtn.setTitle(title, for: .normal )
        })
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func handelTodayButton(_ sender: Any) {
        let alert:UIAlertController = UIAlertController(title: "Change Bottom text", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addTextField { (txtbottom) in
            txtbottom.placeholder = "New bottom 😍"
        }
        alert.addAction(UIAlertAction(title: "OK", style: .destructive) { (getBottom) in
            let bottom:String = (alert.textFields?[0].text!)!
            self.bottomBtn.setTitle(bottom, for: .normal)
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        }

    @IBAction func handelChangeNamePerson1Button(_ sender: Any) {
        let alert:UIAlertController = UIAlertController(title: "Name Person 1", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addTextField { (txtbottom) in
            txtbottom.placeholder = "New name person1"
        }
        alert.addAction(UIAlertAction(title: "OK", style: .destructive) { (getBottom) in
            let namePerson1:String = (alert.textFields?[0].text!)!
            self.changeNamePerson1Btn.setTitle(namePerson1, for: .normal)
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func handelChangeNamePerson2Button(_ sender: Any) {
        let alert:UIAlertController = UIAlertController(title: "Name Person 2", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addTextField { (txtbottom) in
            txtbottom.placeholder = "New name person2"
        }
        alert.addAction(UIAlertAction(title: "OK", style: .destructive) { (getBottom) in
            let namePerson2:String = (alert.textFields?[0].text!)!
            self.changeNamePerson2Btn.setTitle(namePerson2, for: .normal)
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func handelPerson1Button(_ sender: Any) {
        count = 1
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }else{
                print("Camera is not valiable!")
            }
        }))
        actionSheet.addAction((UIAlertAction(title: "Photo Library", style: .default, handler: { (UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        })))
        actionSheet.addAction((UIAlertAction(title: "Cancel", style: .default, handler: nil)))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func handelPerson2Button(_ sender: Any) {
        count = 2
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }else{
                print("Camera is not valiable!")
            }
        }))
        actionSheet.addAction((UIAlertAction(title: "Photo Library", style: .default, handler: { (UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        })))
        actionSheet.addAction((UIAlertAction(title: "Cancel", style: .default, handler: nil)))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        if count == 1 {
            person1Btn.setImage(image, for: UIControl.State.normal)
        }else if count == 2 {
            person2Btn.setImage(image, for: UIControl.State.normal)
        }else if count == 3 {
            backgroudImageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
        //customButton()
    }
    
    @IBAction func handelMenuButton(_ sender: UIBarButtonItem) {
        guard let menuTableViewControlelr = storyboard?.instantiateViewController(withIdentifier: "MenuTableViewController") else {return}
        menuTableViewControlelr.modalPresentationStyle = .overCurrentContext
        menuTableViewControlelr.transitioningDelegate = self
        present(menuTableViewControlelr,animated: true)
    }
    
    @IBAction func handelChangeBackgroundButton(_ sender: UIBarButtonItem) {
        let alert:UIAlertController = UIAlertController(title: "Background Image", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Change", style: .destructive, handler: { (changeBackground) in
            self.count = 3
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController,animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Delete Background", style: .destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert,animated: true, completion: nil)
    }
    
    @IBAction func handelShareButton(_ sender: UIBarButtonItem) {
        let alert:UIAlertController = UIAlertController(title: "Share", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Share", style: .destructive, handler: { (share) in
            UIGraphicsBeginImageContext(self.view.frame.size)
            self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
            let image  = UIGraphicsGetImageFromCurrentImageContext()
            let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
            self.present(vc, animated: true)
            UIGraphicsEndImageContext()
        }))
        alert.addAction(UIAlertAction(title: "Hide AD for a while", style: .destructive, handler: { (hideadforawhile) in
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert,animated: true, completion: nil)
    }
    
    @IBAction func handelSettingButton(_ sender: UIBarButtonItem) {
        let scr = storyboard?.instantiateViewController(identifier: "SettingTableViewController") as! SettingTableViewController
        scr.delegate = self
        navigationController?.pushViewController(scr, animated: true)
        
    }
    
    func reloadName(person1:String, person2:String, title:String, bottom:String){
        self.bottomBtn.setTitle(bottom, for: .normal)
        self.titleBtn.setTitle(title, for: .normal)
        self.changeNamePerson1Btn.setTitle(person1, for: .normal)
        self.changeNamePerson2Btn.setTitle(person2, for: .normal)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func customButton(){
        person1Btn.layer.cornerRadius = person1Btn.frame.size.width / 2
        person2Btn.layer.cornerRadius = person2Btn.frame.size.width / 2
    }
    
}

extension SecondViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}

extension SecondViewController: settingViewDelegate {
    func passData(data: firstSectionInfomation) {
        self.changeNamePerson1Btn.setTitle(data.namePerson1, for: .normal)
        self.changeNamePerson2Btn.setTitle(data.namePerson2, for: .normal)
        self.titleBtn.setTitle(data.changeTitle, for: .normal)
        self.bottomBtn.setTitle(data.changeBottomText, for: .normal)
    }
}
