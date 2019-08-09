//
//  UserInformationViewController.swift
//  RegisterLoginApp
//
//  Created by Mac Project PC on 2019-04-07.
//  Copyright © 2019 Mac Project PC. All rights reserved.
//

import UIKit

class UserInformationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Hello \(currentUser.name)!"
        textField.text = "ID: \(currentUser.id)\nUser name: \(currentUser.name)\nOffice: \(currentUser.office)\nRole: \(currentUser.role)"
    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UILabel!
}
