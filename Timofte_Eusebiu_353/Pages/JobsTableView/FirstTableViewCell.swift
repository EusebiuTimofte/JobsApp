//
//  TableViewCell.swift
//  Timofte_Eusebiu_353
//
//  Created by user169246 on 4/6/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    
    @IBOutlet weak var employer: UILabel!
    
    @IBOutlet weak var publishDate: UILabel!
    @IBOutlet weak var employerImage: UIImageView!
    @IBOutlet weak var city: UILabel!
    
    var descriptionValue: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        cellTitle.backgroundColor = .blue
//        employer.backgroundColor = .green
//        city.backgroundColor = .systemPink
//        publishDate.backgroundColor = .gray
        //self.backgroundColor = .yellow
        
        employerImage.image = UIImage(named: "no-logo")
        self.accessoryType = .disclosureIndicator
        let chevronImageView = UIImageView(image:UIImage(named: "disclosureIndicatorImage"))
        chevronImageView.image = chevronImageView.image?.withRenderingMode(.alwaysTemplate)
        chevronImageView.tintColor = .orange
        chevronImageView.frame = CGRect(x: 0, y: 0, width: self.frame.height / CGFloat(3), height: self.frame.height / CGFloat(3))
        self.accessoryView = chevronImageView
        
        self.layer.cornerRadius = CGFloat(20)
        self.layer.borderWidth = self.frame.height / CGFloat(10)
        self.layer.borderColor = CGColor(srgbRed: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
//        self.layer.borderColor = CGColor(srgbRed: CGFloat(255.0/255.0), green: CGFloat(155.0/255.0), blue: CGFloat(0.0/255.0), alpha: 1.0)

    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
