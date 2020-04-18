//
//  EmployeeProfileViewController.swift
//  Timofte_Eusebiu_353
//
//  Created by user169480 on 4/18/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import UIKit

class EmployeeProfileViewController: UIViewController {

    let userKeywords: [String] = ["it", "pharma", "teamwork", "salary"]
    @IBOutlet var rootView: UIView!
    @IBOutlet weak var keywords: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let label0 = UILabel()
        label0.text = userKeywords[0]
        
        
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
