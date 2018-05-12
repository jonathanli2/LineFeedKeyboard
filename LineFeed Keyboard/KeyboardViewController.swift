//
//  KeyboardViewController.swift
//  LineFeed Keyboard
//
//  Created by Li, Jonathan on 2018-05-07.
//  Copyright © 2018 Li, Jonathan. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var lineFeedButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: UIButtonType.custom)
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Show next keyboard"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .touchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant:10).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10).isActive = true
        
        // Perform custom UI setup here
        self.lineFeedButton = UIButton(type: UIButtonType.custom)
             self.lineFeedButton.setTitleColor(UIColor.purple, for: UIControlState.normal)
        self.lineFeedButton.setTitle(NSLocalizedString("New Line", comment: "Add a new line"), for: [])
        self.lineFeedButton.sizeToFit()
        self.lineFeedButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.lineFeedButton.addTarget(self, action: #selector(keyPressed(sender:)), for: .touchUpInside)
        
        self.view.addSubview(self.lineFeedButton)
        
        self.lineFeedButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        self.lineFeedButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10).isActive = true
    }
    
    @objc func keyPressed(sender: AnyObject?) {
        let button = sender as! UIButton
        if (button == self.lineFeedButton){
            (textDocumentProxy as UIKeyInput).insertText("\r")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

}
