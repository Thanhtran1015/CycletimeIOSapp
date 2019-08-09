//
//  EditingStandardViewController.swift
//  SHC Cycle Time
//
//  Created by Mac on 8/1/19.
//  Copyright © 2019 Mac Project PC. All rights reserved.
//

import UIKit

class EditingStandardViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        submitButton.layer.masksToBounds = true
        submitButton.layer.cornerRadius = 5
        
        closeButton.layer.masksToBounds = true
        closeButton.layer.cornerRadius = 5
        
        wholeView.layer.masksToBounds = true
        wholeView.layer.cornerRadius = 5
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        //Keyboard show hide
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        //Keyboard show hide
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = keyboardSize.cgRectValue
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y = self.view.frame.origin.y - keyboardFrame.height / 2
        }
        
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0{                       self.view.frame.origin.y = 0
        }
    }
    
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @IBAction func submitTouched(_ sender: Any) {
       
        var num1 = 0
        var num2 = 0
        
        if (editTextField.text != nil) {
            num1 = (editTextField.text! as NSString).integerValue
        }
        
        if (editTextField2.text != nil) {
            num2 =  (editTextField2.text! as NSString).integerValue
        }
       
        localStandardCT = Double(num1) + Double(num2) / 10
        cycleTime.standardCT = localStandardCT
        
        self.view.removeFromSuperview()
    }
    @IBAction func closeTouched(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBOutlet weak var editTextField: UITextField!
    @IBOutlet weak var editTextField2: UITextField!
    @IBOutlet weak var wholeView: UIView!
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
}
