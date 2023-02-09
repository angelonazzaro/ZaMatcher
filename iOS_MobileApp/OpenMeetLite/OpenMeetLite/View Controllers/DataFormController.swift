//
//  ViewController.swift
//  OpenMeetLite
//
//  Created by Yuri on 08/02/23.
//

import UIKit


class DataFormController: UIViewController {
    


    @IBOutlet weak var Address: UIButton!
    @IBOutlet weak var Finish: UIButton!
    @IBOutlet var Promptitem: UICommand!
    @IBOutlet weak var Genderpick: UIButton!
    @IBOutlet weak var Searchingchooser: UIButton!
    
    var gender_pick = ""
    var searching_pick = ""
    var location = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPopUpButtons()
        //self.navigationItem.setHidesBackButton(true, animated: true)
    }
        

    @IBAction func didButtonClick(_ sender: UIButton) {
        var message = ""
        
        if(gender_pick.count == 0){
            message += "Select a gender."
        }
        
        if(searching_pick.count == 0){
            message += "\nSelect a searched gender."
        }
        
        if(location.count == 0){
            message += "\nSelect a location."
        }
    
        
        if(message.count > 0){
            let alert = UIAlertController(title: "Invalid inputs", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Oops", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Homepage", bundle: nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "tabbar_controller") as! TabController
            navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
  
    
    /*@IBAction func openAddressBtn(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "DataForm", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "map_form") as! MapController
        self.present(nextViewController, animated: true, completion: nil)
        
    }*/
    
    func setupPopUpButtons() {
        let GenderPickerButtonClosure = { (action: UIAction) in
                self.gender_pick = action.title
            }
        
        let SearchingPickerButtonClosure = { (action: UIAction) in
                self.searching_pick = action.title
            }
        
        
        Genderpick.menu = UIMenu(children: [
                Promptitem,
                UIAction(title: "Male", handler: GenderPickerButtonClosure),
                UIAction(title: "Female", handler: GenderPickerButtonClosure),
                UIAction(title: "Non-Binary", handler: GenderPickerButtonClosure)
            ])
        Genderpick.showsMenuAsPrimaryAction = true
        
        Searchingchooser.menu = UIMenu(children: [
            Promptitem,
            UIAction(title: "Male", handler: SearchingPickerButtonClosure),
            UIAction(title: "Female", handler: SearchingPickerButtonClosure),
            UIAction(title: "Both (Male & Female)", handler: SearchingPickerButtonClosure),
            UIAction(title: "Non-Binary", handler: SearchingPickerButtonClosure),
            UIAction(title: "All", handler: SearchingPickerButtonClosure)
        ])
        Searchingchooser.showsMenuAsPrimaryAction = true
    }
}


