//
//  StrExt.swift
//  Timofte_Eusebiu_353
//
//  Created by user169246 on 4/10/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import Foundation
import UIKit
extension String {
    /// Attempts to return the font specified by name of the appropriate point
    /// size for this string to fit within a particular container size and
    /// constrained to a lower and upper bound point size.
    /// - parameter name: of the font.
    /// - parameter containerSize: that this string should fit inside.
    /// - parameter lowerBound: minimum allowable point size of this font.
    /// - parameter upperBound: maximum allowable point size of this font.
    /// - returns: the font specified by name of the appropriate point
    /// size for this string to fit within a particular container size and
    /// constrained to a lower and upper bound point size; `nil` if no such
    /// font exists.
//    public func font(named name: String,
//                     toFit containerSize: CGSize,
//                     noSmallerThan lowerBound: CGFloat = 1.0,
//                     noLargerThan upperBound: CGFloat = 256.0) -> UIFont? {
//        let lowerBound = lowerBound > upperBound ? upperBound : lowerBound
//        let mid = lowerBound + (upperBound - lowerBound) / 2
//        guard let tempFont = UIFont(name: name, size: mid) else { return nil }
//        let difference = containerSize.height * CGFloat(0.7) -
//            self.size(withAttributes:
//                [NSAttributedString.Key.font : tempFont]).height
//        if mid == lowerBound || mid == upperBound {
//            return UIFont(name: name, size: difference < 0 ? mid - 1 : mid)
//        }
//        return difference < 0 ? font(named: name,
//                                     toFit: containerSize,
//                                     noSmallerThan: lowerBound,
//                                     noLargerThan: mid - 1) :
//            (difference > 0 ? font(named: name,
//                                   toFit: containerSize,
//                                   noSmallerThan: mid,
//                                   noLargerThan: upperBound) :
//                UIFont(name: name, size: mid))
//    }
}
