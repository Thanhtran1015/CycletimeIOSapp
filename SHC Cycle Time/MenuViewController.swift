//
//  AdminLoginViewController.swift
//  RegisterLoginApp
//
//  Created by Mac Project PC on 2019-03-29.
//  Copyright © 2019 Mac Project PC. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //GetTimeTableFromUrl(url: urlTime)
        //GetMonoRealAndAverageCycleTimeFromUrl(url: urlTime)
        GetWorkersFromUrl(url: urlWorkers)
        GetMachinesFromUrl(url: urlMachines)
        GetComponentCollectionsFromUrl(url: urlComponentCollections)
    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var WatchCycleTimeButton: UIButton!
    @IBOutlet weak var ViewUserInformationButton: UIButton!
    @IBOutlet weak var RegisterButton: UIButton!
    @IBOutlet weak var bottomToolbar: UIToolbar!
    
    
    @IBAction func WatchCycleTimeButtonClicked(_ sender: Any) {
        let a = true
        
        if (a == true) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let mainViewController = storyBoard.instantiateViewController(withIdentifier: "CycleTimeStoryBoard") as! CycleTimeViewController
            
            self.present(mainViewController, animated:false, completion:nil)
        }
    }
    
    @IBAction func RegisterButtonClicked(_ sender: Any) {
        //let a = true
        
        if (currentUser.roleId <= 2) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let mainViewController = storyBoard.instantiateViewController(withIdentifier: "RegisterStoryBoard") as! RegisterViewController
            
            self.present(mainViewController, animated:false, completion:nil)
        }
        else {
            label.text = "Your role level is not allowed to register users"
        }
    }
    
    @IBAction func ViewUserInformationButtonClicked(_ sender: Any) {
        let a = true
        if (a == true) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let mainViewController = storyBoard.instantiateViewController(withIdentifier: "UserInformationStoryBoard") as! UserInformationViewController
            
            self.present(mainViewController, animated:false, completion:nil)
        }
    }
    
    @IBAction func LogoutButtonClicked(_ sender: Any) {
        //end session
        
        let a = true
        
        if (a == true) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let mainViewController = storyBoard.instantiateViewController(withIdentifier: "StartupStoryBoard") as! StartupViewController
            
            self.present(mainViewController, animated:false, completion:nil)
        }
    }
    
}
