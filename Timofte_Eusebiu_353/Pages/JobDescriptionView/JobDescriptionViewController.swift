//
//  JobDescriptionViewController.swift
//  Timofte_Eusebiu_353
//
//  Created by user169246 on 4/11/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import Foundation
import UIKit

class JobDescriptionViewController : UIViewController {
    
    var jobTitle: String?
    
    @IBOutlet weak var scrollViewContent: UIView!
    @IBOutlet weak var jobTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let jobTitleText = jobTitle {
            jobTitleLabel.text = jobTitleText
        }
        var labelFontSizeMultiplier: CGFloat = 30
        if UIScreen.main.bounds.width > 500 {
            labelFontSizeMultiplier = 20
        }
        jobTitleLabel.font = jobTitleLabel.fontToFitHeight(height: scrollViewContent.frame.height / labelFontSizeMultiplier)
    }
    
    
}
