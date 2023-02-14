//
//  ViewController.swift
//  OpenMeetLite
//
//  Created by Yuri on 07/02/23.
//

import UIKit

extension Date{
    var age: Int { Calendar.current.dateComponents([.year], from: self, to: Date()).year! }
}

class RegistrationController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Surname: UITextField!
    @IBOutlet weak var Birthpicker: UIDatePicker!
    @IBOutlet weak var Signup: UIButton!
    
    var email_val = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Email.text = email_val
        Name.delegate = self
        Surname.delegate = self
        
        Birthpicker.maximumDate = Date()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField{
            case Name : do {
                self.Surname.becomeFirstResponder()
            };break
            case Surname: do {
                self.Surname.resignFirstResponder()
            };break
            default: do {
                print("should not be here")
            }
        }
        return true
    }
    
    @IBAction func didButtonClick(_ sender: UIButton) {
        
        var message = ""
        
        if(Name.text == nil || Name.text?.count == 0){
            message += "Name field empty."
        }
            
            
        if(Surname.text == nil || Surname.text?.count == 0){
            message += "\nSurname field empty."
        }
        
        if(Birthpicker.date.age < 18){
            message += "\nYou're too little, maybe you can let your mom sign up."
        }
        
        if(message.count > 0){
            let alert = UIAlertController(title: "Invalid inputs", message: message, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Oops", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            let m = Meeter(name: Name.text!, surname: Surname.text!, gender: "", searchingGender: "", age: Birthpicker.date.age, interests: "", latitude: 0.0, longitude: 0.0)
            doStoreMeeter(meeter: m)
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "InterestForm", bundle: nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "interest_form") as! InterestFormController
            navigationController?.pushViewController(nextViewController, animated: true)
            
        }
       
        
    }
    
}


