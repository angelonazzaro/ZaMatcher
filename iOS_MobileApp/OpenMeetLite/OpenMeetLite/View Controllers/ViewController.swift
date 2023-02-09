//
//  ViewController.swift
//  OpenMeetLite
//
//  Created by Yuri on 07/02/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var Continue: UIButton!
    
    @IBOutlet weak var Email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Email.delegate = self
       
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        Email.resignFirstResponder()
        print("prova")
        return true
    }
    
    
    @IBAction func didButtonClick(_ sender: UIButton) {
        let email = Email.text
        
        
        if(email != nil && email != "" && email?.lowercased().range(of: "^[a-z0-9!#$%&'*+=?^_`{|}~/-]+([.][a-z0-9!#$%&'*+=?^_`{|}~/-]+)*@([a-z0-9-]+[.])+[a-z]+$", options: .regularExpression, range: nil, locale: nil) != nil){
           
            let storyBoard: UIStoryboard = UIStoryboard(name: "RegistrationForm", bundle: nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "registration_form") as! RegistrationController
            nextViewController.email_val = email!
            navigationController?.pushViewController(nextViewController, animated: true)

        }
        else{
            let alert = UIAlertController(title: "Invalid email", message: "The email is not vald", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Oops", style: .default, handler: { action in
                self.Email.becomeFirstResponder()
            }))
            self.present(alert, animated: true, completion: nil)
        }
     
    }

}

