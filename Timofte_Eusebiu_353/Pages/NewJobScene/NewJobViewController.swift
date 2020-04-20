//
//  NewJobViewController.swift
//  Timofte_Eusebiu_353
//
//  Created by user169480 on 4/20/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import UIKit

class NewJobViewController: UIViewController {

    
    @IBOutlet weak var jobTitle: UILabel!
    
    @IBOutlet weak var jobTitleInput: UITextField!
    
    @IBOutlet weak var locationInput: UITextField!
    
    @IBOutlet weak var descriptionInput: UITextView!
    
    @IBOutlet weak var domainInput: UITextField!
    
    @IBOutlet weak var createButton: UIButton!
    
    @IBOutlet weak var warning: FontHeightAdjustableLabel!
    
    @IBAction func createJob(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
