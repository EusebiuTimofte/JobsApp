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
    var locationReceived: String?
    var publishDateReceived: String?
    var descriptionValueReceived: String?
    
    
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
    @IBOutlet weak var apply: UIButton!
    
    
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
        
        descriptionValue.text = "Description aslkda kalsdkasp lkpal dkasdplk aspldk pl kplkplkplkasd p askdplk aspldk aspdl kplad kpasldkpaslkpasdlk pasdlk plask lpaskd pasdk pk pak pask paskd pk p kaspdk aspdkaspk kdk apsdkp askasdpkas pk pk apsk paskdpask asp kpak paskdpkasaskask k apskdaskdpak apsdk apskpakapskdpasdkaspdkp padkaskdpapskdaspdaslpdaslpdaslpdlpasdlpasdpaskaspdaspdpasdpasda pakspdapdask"
        
        descriptionValue.sizeToFit()
        scrollViewContent.layoutIfNeeded()
        scrollViewElement.contentSize = scrollViewContent.frame.size
        
//        var labelFontSizeMultiplier: CGFloat = 30
//        if UIScreen.main.bounds.width > 500 {
//            labelFontSizeMultiplier = 18
//        }
//
//        jobTitleLabel.font = jobTitleLabel.fontToFitHeight(height: scrollViewContent.frame.height / labelFontSizeMultiplier)
//
//        jobTitle.font = jobTitle.fontToFitHeight(height: scrollViewContent.frame.height / (labelFontSizeMultiplier - CGFloat(5)))
//
//        employerLabel.font = employerLabel.fontToFitHeight(height: scrollViewContent.frame.height / (labelFontSizeMultiplier - CGFloat(5)))
//
//        employer.font = employer.fontToFitHeight(height: scrollViewContent.frame.height / labelFontSizeMultiplier)
//
//        locationLabel.font = locationLabel.fontToFitHeight(height: scrollViewContent.frame.height / (labelFontSizeMultiplier - CGFloat(5)))
//
//        location.font = location.fontToFitHeight(height: scrollViewContent.frame.height / labelFontSizeMultiplier)
//
//        publishDateLabel.font = publishDateLabel.fontToFitHeight(height: scrollViewContent.frame.height / (labelFontSizeMultiplier - CGFloat(5)))
//
//        publishDate.font = publishDate.fontToFitHeight(height: scrollViewContent.frame.height / labelFontSizeMultiplier)
//
//        descriptionLabel.font = descriptionLabel.fontToFitHeight(height: scrollViewContent.frame.height / (labelFontSizeMultiplier - CGFloat(5)))
//
//        descriptionValue.font = descriptionValue.fontToFitHeight(height: scrollViewContent.frame.height / labelFontSizeMultiplier)
        
        
    }
    
    
}
