//
//  AppliedJobDescriptionView.swift
//  Timofte_Eusebiu_353
//
//  Created by user169480 on 4/17/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import UIKit

class AppliedJobDescriptionViewController: UIViewController {

    var jobTitleReceived: String?
        var employerImageReceived: UIImage?
        var employerReceived: String?
        var locationReceived: String?
        var publishDateReceived: String?
        var descriptionValueReceived: String?
        var idReceived: Int?
        
        
        @IBOutlet weak var scrollViewElement: UIScrollView!
        @IBOutlet weak var employerImage: UIImageView!
        @IBOutlet weak var scrollViewContent: UIView!
        @IBOutlet weak var jobTitleLabel: UILabel!
        @IBOutlet weak var jobTitle: UILabel!
        @IBOutlet weak var employerLabel: UILabel!
        @IBOutlet weak var employer: UILabel!
        @IBOutlet weak var locationLabel: UILabel!
        @IBOutlet weak var location: UILabel!
        @IBOutlet weak var publishDateLabel: UILabel!
        @IBOutlet weak var publishDate: UILabel!
        @IBOutlet weak var descriptionLabel: UILabel!
        @IBOutlet weak var descriptionValue: UILabel!
        
        var id: Int?
        
        
        
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
            
            if let locationReceivedLet = locationReceived {
                location.text = locationReceivedLet
            }
            
            if let publishDateReceivedLet = publishDateReceived {
                publishDate.text = publishDateReceivedLet
            }
            
            if let descriptionValueReceivedLet = descriptionValueReceived {
                descriptionValue.text = descriptionValueReceivedLet
            }
            
            if let receivedIdLet = idReceived {
                id = receivedIdLet
            }
            
            
           
            
            var labelFontSizeMultiplier: CGFloat = 30
            if UIScreen.main.bounds.width > 500 {
                labelFontSizeMultiplier = 18
            }
    //
            jobTitleLabel.font = jobTitleLabel.fontToFitHeight(height: scrollViewElement.frame.height / labelFontSizeMultiplier)

            jobTitle.font = jobTitle.fontToFitHeight(height: scrollViewElement.frame.height / (labelFontSizeMultiplier - CGFloat(4)))

            employerLabel.font = employerLabel.fontToFitHeight(height: scrollViewElement.frame.height / (labelFontSizeMultiplier - CGFloat(4)))

            employer.font = employer.fontToFitHeight(height: scrollViewElement.frame.height / labelFontSizeMultiplier)

            locationLabel.font = locationLabel.fontToFitHeight(height: scrollViewElement.frame.height / (labelFontSizeMultiplier - CGFloat(4)))

            location.font = location.fontToFitHeight(height: scrollViewElement.frame.height / labelFontSizeMultiplier)

            publishDateLabel.font = publishDateLabel.fontToFitHeight(height: scrollViewElement.frame.height / (labelFontSizeMultiplier - CGFloat(4)))

            publishDate.font = publishDate.fontToFitHeight(height: scrollViewElement.frame.height / labelFontSizeMultiplier)

            descriptionLabel.font = descriptionLabel.fontToFitHeight(height: scrollViewElement.frame.height / (labelFontSizeMultiplier - CGFloat(4)))

            descriptionValue.font = descriptionValue.fontToFitHeight(height: scrollViewElement.frame.height / labelFontSizeMultiplier)
            
            
            jobTitleLabel.sizeToFit()
            jobTitle.sizeToFit()
            employerLabel.sizeToFit()
            employer.sizeToFit()
            locationLabel.sizeToFit()
            location.sizeToFit()
            publishDateLabel.sizeToFit()
            publishDate.sizeToFit()
            descriptionLabel.sizeToFit()
            descriptionValue.sizeToFit()
            
            scrollViewContent.layoutIfNeeded()
            scrollViewElement.contentSize = scrollViewContent.frame.size
            
        }

}