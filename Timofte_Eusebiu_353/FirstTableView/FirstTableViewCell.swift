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

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
