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
        cellTitle.backgroundColor = .blue
//        let fontSize = CGFloat(50)
//        cellTitle.font = UIFont(name: "Helvetica Neue", size: fontSize)
//        while cellTitle.font.lineHeight > cellTitle.frame.size.height{
//            fontSize -= CGFloat(0.1)
//            cellTitle.font = UIFont(name: "Helvetica Neue", size: fontSize)
//        }
        //option 1
//        let fontSizer = FontSizer()
//        cellTitle.font = fontSizer.optimisedfindAdaptiveFontWithName(fontName: "Helvetica Neue", label: cellTitle, minSize: CGFloat(1), maxSize: CGFloat(300))
        
        cellTitle.numberOfLines = 2
//        cellTitle.minimumScaleFactor = 0.7   //you need
//        cellTitle.adjustsFontSizeToFitWidth = true
        self.backgroundColor = .yellow
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
