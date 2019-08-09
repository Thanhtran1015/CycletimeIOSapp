//
//  RegisterSuccessfulPopUpViewController.swift
//  RegisterLoginApp
//
//  Created by Mac Project PC on 2019-03-29.
//  Copyright © 2019 Mac Project PC. All rights reserved.
//

import UIKit

class RegisterSuccessfulPopUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func okButtonClicked(_ sender: Any) {
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

}
