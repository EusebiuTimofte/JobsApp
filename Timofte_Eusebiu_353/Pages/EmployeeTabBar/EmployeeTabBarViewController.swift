//
//  EmployeeTabBarViewController.swift
//  Timofte_Eusebiu_353
//
//  Created by user169480 on 4/21/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import UIKit

class EmployeeTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let nr = 0
        if nr > 0 {
            tabBar.items![3].badgeValue = String(nr)
        }else {
            tabBar.items![3].badgeValue = nil
        }
        
    }
    
    func updateBadge() {
        let nr = 0
        if nr > 0 {
            tabBar.items![3].badgeValue = String(nr)
        }else {
            tabBar.items![3].badgeValue = nil
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
