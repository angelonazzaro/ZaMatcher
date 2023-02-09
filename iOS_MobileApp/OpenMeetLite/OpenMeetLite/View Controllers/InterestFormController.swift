//
//  InterestFormController.swift
//  OpenMeetLite
//
//  Created by Yuri on 08/02/23.
//

import UIKit

class InterestFormController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var items: [String] = ["Alan", "Braus", "Adriana", "Mitchell", "Dani", "Jess", "Dan", "Meredith", "Dan", "Milad"]
    var selectedItems = [String]()
    
    
    @IBOutlet weak var Tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        //Tableview.allowsMultipleSelection = true
        //let tvc = TableViewController()
        Tableview.dataSource = self
        Tableview.delegate = self
    }
    
    @IBAction func didClickConinue(_ sender: UIButton) {
        var message = ""
        
        if(selectedItems.count < 3){
            message += "You must select at least 3 interests."
        }
        else
            if(selectedItems.count > 6){
            message += "You can't select more than 6 interests"
            }
    
        
        if(message.count > 0){
            let alert = UIAlertController(title: "Invalid inputs", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Oops", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "DataForm", bundle: nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "data_form") as! DataFormController
            navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItems.append(items[indexPath.row])
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        print(selectedItems)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        selectedItems.removeAll(where: {items[indexPath.row].contains($0)})
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        print(selectedItems)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}
