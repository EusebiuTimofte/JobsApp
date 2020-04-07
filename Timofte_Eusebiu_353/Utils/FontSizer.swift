//
//  FontSizer.swift
//  Timofte_Eusebiu_353
//
//  Created by user169246 on 4/8/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import Foundation
import UIKit
class FontSizer {
    
    func optimisedfindAdaptiveFontWithName(fontName:String, label:UILabel!, minSize:CGFloat,maxSize:CGFloat) -> UIFont!
    {

        var tempFont:UIFont
        //var tempHeight:CGFloat
        var tempMax:CGFloat = maxSize
        var tempMin:CGFloat = minSize

        while (ceil(tempMin) != ceil(tempMax)){
            let testedSize = (tempMax + tempMin) / 2


            tempFont = UIFont(name:fontName, size:testedSize)!
            let attributedString = NSAttributedString(string: label.text!, attributes: [NSAttributedString.Key.font : tempFont])

            let textFrame = attributedString.boundingRect(with: CGSize(width: label.bounds.size.width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin , context: nil)

            let difference = label.frame.height * CGFloat(0.9) - textFrame.height
//            println("\(tempMin)-\(tempMax) - tested : \(testedSize) --> difference : \(difference)")
            if(difference > 0){
                tempMin = testedSize
            }else{
                tempMax = testedSize
            }
        }


        //returning the size -1 (to have enought space right and left)
        return UIFont(name: fontName, size: tempMin - 1)
    }
    
}
