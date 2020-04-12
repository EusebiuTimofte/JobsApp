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
    
    var jobTitleReceived: String?
    var employerImageReceived: UIImage?
    var employerReceived: String?
    
    @IBOutlet weak var employerImage: UIImageView!
    @IBOutlet weak var scrollViewContent: UIView!
    @IBOutlet weak var jobTitleLabel: UILabel!
    
    @IBOutlet weak var jobTitle: UILabel!
    
    @IBOutlet weak var employerLabel: UILabel!
    
    @IBOutlet weak var employer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let jobTitleText = jobTitleReceived {
            jobTitleLabel.text = jobTitleText
        }
        
        if let employerImageView = employerImageReceived {
            employerImage.image = employerImageView
        }
        
        if let employerReceivedLet = employerReceived {
            employer.text = employerReceivedLet
        }
        
        var labelFontSizeMultiplier: CGFloat = 30
        if UIScreen.main.bounds.width > 500 {
            labelFontSizeMultiplier = 18
        }
        
        jobTitleLabel.font = jobTitleLabel.fontToFitHeight(height: scrollViewContent.frame.height / labelFontSizeMultiplier)
        
        jobTitle.font = jobTitle.fontToFitHeight(height: scrollViewContent.frame.height / (labelFontSizeMultiplier - CGFloat(5)))
        
        employerLabel.font = employerLabel.fontToFitHeight(height: scrollViewContent.frame.height / (labelFontSizeMultiplier - CGFloat(5)))
        
        employer.font = employer.fontToFitHeight(height: scrollViewContent.frame.height / labelFontSizeMultiplier)
    }
    
    
}
