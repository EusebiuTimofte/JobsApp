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
        
        jobTitleInput.font = jobTitle.fontToFitHeight(height: jobTitleInput.frame.height * CGFloat(2.0/3.0))
        jobTitleInput.sizeToFit()
        locationInput.font = jobTitle.fontToFitHeight(height: locationInput.frame.height * CGFloat(2.0/3.0))
        locationInput.sizeToFit()
        descriptionInput.font = jobTitle.fontToFitHeight(height: UIScreen.main.bounds.height * CGFloat(0.1/3.0))
        //descriptionInput.sizeToFit()
        domainInput.font  = jobTitle.fontToFitHeight(height: domainInput.frame.height * CGFloat(2.0/3.0))
        descriptionInput.sizeToFit()
        createButton.titleLabel?.font = createButton.titleLabel?.fontToFitHeight(height: createButton.frame.size.height)
        descriptionInput.layer.borderWidth = CGFloat(UIScreen.main.bounds.height / CGFloat(300))
        descriptionInput.layoutIfNeeded()
        
        
        
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
