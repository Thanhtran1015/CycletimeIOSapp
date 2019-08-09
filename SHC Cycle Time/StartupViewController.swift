//
//  StartupViewController.swift
//  RegisterLoginApp
//
//  Created by Mac Project PC on 2019-03-26.
//  Copyright © 2019 Mac Project PC. All rights reserved.
//

import UIKit
//import Alamofire
//import JWTDecode

class StartupViewController: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        GetUserCollectionFromUrl(url: urlUser)
        
        //requestGetAuthenticateResponse()
        //decodeDataFromJsonToUserInformation()
//        do {
//        print(try decode(jwt: "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJwc2VybmFtZSI6InBldGVyIiwicGFzc3dvcmQiOiIxIiwib2ZmaWNlIjoidnAiLCJyb2xlaWQiOiIxIn0.6tIhc4exla7Hy2WmgtK2uF3eg1PMgrbmho5aYSbBvJFSb8LEoFvaTi_21jzCJ7uSXXjSzDDxrZnepaCF526YIg"))
//        } catch {
//            print("decoding failed")
//        }
//
        
        userNameField.delegate = self
        passwordField.delegate = self
        print ("")
        
        //Keyboard show hide
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        //Keyboard show hide
    }
    
    
//    func postUsernamAndPasswordToServer() {
//
//        let parameters: [String: AnyObject] = [
//            "IdQuiz" : 102 as AnyObject,
//            "IdUser" : "iosclient" as AnyObject,
//            "User" : "iosclient" as AnyObject,
//            "List": [
//                [
//                    "IdQuestion" : 5,
//                    "IdProposition": 2,
//                    "Time" : 32
//                ],
//                [
//                    "IdQuestion" : 4,
//                    "IdProposition": 3,
//                    "Time" : 9
//                ]
//                ] as AnyObject
//        ]
//
//
//        AF.request("http://google.com", method: .post, parameters: parameters, encoding: JSONEncoding.default)
//            .responseJSON { response in
//                print(response)
//        }
//    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = keyboardSize.cgRectValue
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y = self.view.frame.origin.y - keyboardFrame.height + bottomToolbar.bounds.size.height + additionalLoginButtonZone.bounds.size.height
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
    
//    public func getUserCollection() ->Array<User> {
//        return userCollection
//    }
//
    
    @IBOutlet weak var loginNavBar: UINavigationBar!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var additionalLoginButtonZone: UIView!
    
    @IBOutlet weak var bottomToolbar: UIToolbar!
    
    @IBAction func LoginButtonClicked(_ sender: Any) {
        
//        let url1 = URL(string: "https://10.4.5.61:8045/api/accounts")
//        let url2 = URL(string: "https://5c9ef054595c55001487bfb8.mockapi.io/users")
        
        
        if ((userNameField.text == "")||(passwordField.text == "")) {

            label.text = "Please enter information for BOTH field!"

        }
        else {
           // URLAccessing(url: url3!)
            
            if InformationIsCorrect(name: userNameField.text!,password: passwordField.text!) == true {
                
                            label.text = "Login successful"
                                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

                                let mainViewController = storyBoard.instantiateViewController(withIdentifier: "MenuStoryBoard") as! MenuViewController
                
                                self.present(mainViewController, animated:false, completion:nil)
                            }
                
                else {
                label.text = "Wrong User Name or Password!"
                
            }
            
        }
        
                        //PrintUserCollection()
    }
        //
//            requestGetAuthenticateResponse(username: userNameField.text!, password: passwordField.text!)
        
            //decodeDataFromJsonToUserInformation(username: userNameField.text!, password: passwordField.text!)

            //print("User:")
            //print(currentUser)
            
        //}
        //postUsernamAndPasswordToServer()
       
//        if ((userNameField.text == "")||(passwordField.text == "")) {
//            label.text = "Please enter information for BOTH field!"
//        }
//
//        else {
//
//            if InformationIsCorrect() == true {
//            label.text = "Login successful"
//                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//
//                let mainViewController = storyBoard.instantiateViewController(withIdentifier: "MainStoryBoard") as! MainViewController
//
//                self.present(mainViewController, animated:true, completion:nil)
//            }
//
//            else {
//            label.text = "Wrong User Name or Password!"
//            }
//
//        }
//
//        PrintUserCollection()

    
    func InformationIsCorrect(name:String,password:String) -> Bool{
        for user in userCollectionFromUrl {
            if (name.uppercased() == user.name.uppercased()) && (password.uppercased() == user.password.uppercased()) {
                currentUser.id = user.id
                currentUser.name = user.name
                currentUser.password = user.password
                currentUser.office = user.office
                currentUser.roleId = user.roleId
                currentUser.role = user.role
                return true
            }
        }
        return false
    }
    
    
//    func PrintUserCollection() {
//        for user in userCollection {
//                print ("\(user.id)-\(user.name)-\(user.password)-\(user.office)")
//        }
//    }
    
   

   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
