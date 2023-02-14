//
//  TabController.swift
//  OpenMeetLite
//
//  Created by Yuri on 08/02/23.
//

import UIKit

class TabController: UITabBarController {
    
    @IBOutlet weak var Tabbar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
  
        let m = doRetrieveMeeter()
        Tabbar.items?[2].title = m.name
        
        self.selectedIndex = 1
        
    }
}
