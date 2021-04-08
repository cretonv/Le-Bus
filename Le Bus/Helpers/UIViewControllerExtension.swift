//
//  UIViewControllerExtension.swift
//  Le Bus
//
//  Created by Vincent Creton on 08/04/2021.
//

import UIKit

// This code add the dismisskeyboard function to Close IOS Keyboard when you touch around	
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
