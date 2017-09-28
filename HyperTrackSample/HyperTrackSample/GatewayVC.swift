//
//  GatewayVC.swift
//  HyperTrackSample
//
//  Created by Sam Paul on 19/09/17.
//  Copyright © 2017 Turvo. All rights reserved.
//

import UIKit
import HyperTrack

class GatewayVC: UIViewController {
    @IBOutlet var action: UIButton!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func action(_ sender: Any) {
        if let name = nameTextField.text, name.characters.count > 0, let phoneNumber = phoneNumberTextField.text, phoneNumber.characters.count > 0 {
            HyperTrack.getOrCreateUser(name, phoneNumber, phoneNumber, nil, completionHandler: { (user, error) in
                if (error != nil) {
                    // Handle getOrCreateUser API error here
                    self.showAlert("Error", message: (error?.type.rawValue)!)
                    return
                }
                
                if (user != nil) {
                    // Handle getOrCreateUser API success here
                    self.onLoginSuccess()
                }
            })
        }
    }
    
    private func onLoginSuccess() {
        performSegue(withIdentifier: "MapView", sender: self)
    }
    
    private func showAlert(_ title: String = "Alert", message: String) {
        // create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}

