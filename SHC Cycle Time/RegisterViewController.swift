//
//  RegisterViewController.swift
//  RegisterLoginApp
//
//  Created by Mac Project PC on 2019-03-26.
//  Copyright © 2019 Mac Project PC. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController,UITextFieldDelegate {
    
    
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var officeField: UITextField!
    @IBOutlet weak var bottomToolBar: UIToolbar!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var registerButtonViewZone: UIView!
    @IBOutlet weak var additionalRegisterButtonZone: UIView!
    
    @IBOutlet weak var label: UILabel!
    
    func informationIsValid() ->Bool {
        for user:User in userCollectionFromUrl {
            if (user.name == userNameField.text) {
                return false
            }
        }
        return true
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = keyboardSize.cgRectValue
        if self.view.frame.origin.y == 0{
            self.view.frame.origin.y = self.view.frame.origin.y - keyboardFrame.height + bottomToolBar.frame.height + additionalRegisterButtonZone.frame.height
        }
        
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0{                   self.view.frame.origin.y = 0
        }
    }
    
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
//    @IBAction func RegisterButtonClicked(_ sender: Any) {
//
//        if (userNameField.text=="")||(passwordField.text=="")||(officeField.text=="") {
//
//            label.text = "Please provide ALL informations!"
//        }
//
//
//        else {
//
//        if (informationIsValid()) {
//            userCollection.append(User(id:userIdArray.last! + 1,name:userNameField.text!,password:passwordField.text!,office:officeField.text!,roleId:0))
//
//            //userIdArray.append(userIdArray.last! + 1)
//
//            userNameField.text = ""
//            passwordField.text = ""
//            officeField.text = ""
//
//            let popUpViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterSuccessfulPopUpStoryBoard") as! RegisterSuccessfulPopUpViewController
//            self.addChild(popUpViewController)
//            popUpViewController.view.frame = self.view.frame
//            self.view.addSubview(popUpViewController.view)
//            popUpViewController.didMove(toParent: self)
//
//        }
//
//        else {
//            label.text = "Sorry, User Name had already been used!"
//            }
//        }
//
//    }
    

//        for user in userCollection {
//            print ("\(user.id)-\(user.name)-\(user.password)-\(user.office)")
//        }
        //        userCollection.append(User(id: "002",name: "henry",password: "h",office: "vp"))
        //        userCollection.append(User(id: "003",name: "swook",password: "s",office: "vp"))
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //newIdLabel.text = "New ID: " + String(idArray.last!)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        userNameField.delegate = self
        passwordField.delegate = self
        officeField.delegate = self
    }
    
    @IBAction func doneButtonClicked(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

