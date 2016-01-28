//
//  SignUpViewController.swift
//  WhaleTalk
//
//  Created by Joshua Kuehn on 1/28/16.
//  Copyright © 2016 Kuehn LLC. All rights reserved.
//

import UIKit
import CoreData


class SignUpViewController: UIViewController {
    
    private let phoneNumberField = UITextField()
    
    var context: NSManagedObjectContext?
    var remoteStorage: RemoteStorage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        
        let label = UILabel()
        label.text = "Sign up with WhaleTalk"
        label.font = UIFont.systemFontOfSize(24)
        view.addSubview(label)
        
        let continueButton = UIButton()
        continueButton.setTitle("Continue", forState: .Normal)
        continueButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        continueButton.addTarget(self, action: "pressedContinue:", forControlEvents: .TouchUpInside)
        view.addSubview(continueButton)
        
        phoneNumberField.keyboardType = .PhonePad
        phoneNumberField.layer.borderColor = UIColor.grayColor().CGColor
        phoneNumberField.layer.borderWidth = 1
        phoneNumberField.placeholder = "Phone Number"
        view.addSubview(phoneNumberField)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberField.translatesAutoresizingMaskIntoConstraints = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints: [NSLayoutConstraint] = [
            label.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor,constant: 20),
            label.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor),
            phoneNumberField.topAnchor.constraintEqualToAnchor(label.bottomAnchor, constant: 20),
            phoneNumberField.leadingAnchor.constraintEqualToAnchor(view.layoutMarginsGuide.leadingAnchor),
            phoneNumberField.trailingAnchor.constraintEqualToAnchor(view.layoutMarginsGuide.trailingAnchor),
            continueButton.topAnchor.constraintEqualToAnchor(phoneNumberField.bottomAnchor,constant: 20),
            continueButton.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activateConstraints(constraints)
        
        phoneNumberField.becomeFirstResponder()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func pressedContinue(sender: UIButton) {
        remoteStorage?.signUp(phoneNumberField.text!,
            success: {
                let vc = ChatViewController()
                vc.context = self.context
                self.presentViewController(vc, animated: true, completion: nil)},
            error: { errorString in
                let alertController = UIAlertController(title: "Error", message: errorString, preferredStyle: .Alert)
                let OKAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alertController.addAction(OKAction)
                self.presentViewController(alertController, animated: true, completion: nil)} )
    }

}












