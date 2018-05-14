//
//  KeyboardViewController.swift
//  LineFeed Keyboard
//
//  Created by Li, Jonathan on 2018-05-07.
//  Copyright © 2018 Li, Jonathan. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

  //  @IBOutlet var nextKeyboardButton: UIButton!
 //   @IBOutlet var lineFeedButton: UIButton!
    @IBAction func onCut(_ sender: Any) {
        UIPasteboard.general.string = textDocumentProxy.selectedText
        (textDocumentProxy as UIKeyInput).insertText(" ")
        (textDocumentProxy as UIKeyInput).deleteBackward()
    }
    
    @IBAction func onCopy(_ sender: Any) {
        UIPasteboard.general.string = textDocumentProxy.selectedText
    }
    
    @IBAction func onPaste(_ sender: Any) {
        guard let data = UIPasteboard.general.string else {
            return
        }
        (textDocumentProxy as UIKeyInput).insertText(data)
    }
    
    @IBAction func onDirectionLeft(_ sender: Any) {
        
        textDocumentProxy.adjustTextPosition(byCharacterOffset: -1)
    }
    @IBAction func onDirectionRight(_ sender: Any) {
        
        textDocumentProxy.adjustTextPosition(byCharacterOffset: 1)
    }
    @IBAction func onNextKeyboard(_ sender: Any) {
        self.advanceToNextInputMode()
    }
    
    @IBAction func onReturnPressed(_ sender: Any) {
        (textDocumentProxy as UIKeyInput).insertText("\r")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
/*
    @objc func keyPressed(sender: AnyObject?) {
        let button = sender as! UIButton
        if (button == self.lineFeedButton){
            (textDocumentProxy as UIKeyInput).insertText("\r")
        }
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
*/
}
