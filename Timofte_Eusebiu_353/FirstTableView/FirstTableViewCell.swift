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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //job title
//        cellTitle.frame = CGRect(x: self.frame.width / 10, y: self.frame.height / 15, width: self.frame.width * 8 / 10, height: self.frame.height / 5)
//        cellTitle.numberOfLines = 1
        cellTitle.backgroundColor = .blue
        
        //cell
        self.backgroundColor = .yellow
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
