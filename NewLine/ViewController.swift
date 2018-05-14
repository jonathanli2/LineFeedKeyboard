//
//  ViewController.swift
//  NewLine
//
//  Created by Li, Jonathan on 2018-05-07.
//  Copyright © 2018 Li, Jonathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtView: UITextView!
    
    @IBOutlet weak var installKeyBoard: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let description = NSLocalizedString("Description", comment: "Show keyboard description")
        txtView.text = description;
     //   txtView.becomeFirstResponder();
        
        let install = NSLocalizedString("installkeyboard", comment: "Install keyboard description")
        installKeyBoard.setTitle(install, for: [])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onInstallKeyboard(_ sender: Any) {
           UIApplication.shared.open(URL(string:"App-Prefs:root=General&path=Keyboard/KEYBOARDS")!)
    }
}

