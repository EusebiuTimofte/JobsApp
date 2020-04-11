//
//  FontHeightAdjustableLabel.swift
//  Timofte_Eusebiu_353
//
//  Created by user169246 on 4/9/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import UIKit
import Foundation

class FontHeightAdjustableLabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func layoutSubviews() {
           super.layoutSubviews()
           font = fontToFitHeight()
       }

       // Returns an UIFont that fits the new label's height.
    private func fontToFitHeight() -> UIFont {

           var minFontSize: CGFloat = CGFloat(18) // CGFloat 18
           var maxFontSize: CGFloat = CGFloat(67)     // CGFloat 67
           var fontSizeAverage: CGFloat = 0
           var textAndLabelHeightDiff: CGFloat = 0

           while (minFontSize <= maxFontSize) {

               fontSizeAverage = minFontSize + (maxFontSize - minFontSize) / 2

               // Abort if text happens to be nil
            guard text!.count > 0 else {
                 break
               }

            if let labelText: NSString = text as NSString? {
                let labelHeight = frame.size.height / CGFloat(Double(self.numberOfLines) + 0.1)

                let testStringHeight = labelText.size(
                    withAttributes: [NSAttributedString.Key.font: font.withSize(fontSizeAverage)]
                   ).height

                   textAndLabelHeightDiff = labelHeight - testStringHeight

                   if (fontSizeAverage == minFontSize || fontSizeAverage == maxFontSize) {
                       if (textAndLabelHeightDiff < 0) {
                        return font.withSize(fontSizeAverage - 1)
                       }
                    return font.withSize(fontSizeAverage)
                   }

                   if (textAndLabelHeightDiff < 0) {
                       maxFontSize = fontSizeAverage - 1

                   } else if (textAndLabelHeightDiff > 0) {
                       minFontSize = fontSizeAverage + 1

                   } else {
                    return font.withSize(fontSizeAverage)
                   }
               }
           }
        return font.withSize(fontSizeAverage)
       }
    
    
    

}
