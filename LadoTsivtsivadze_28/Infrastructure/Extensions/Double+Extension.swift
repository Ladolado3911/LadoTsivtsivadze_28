//
//  Double+Extension.swift
//  LadoTsivtsivadze_27
//
//  Created by Ladolado3911 on 6/7/21.
//

import Foundation
import UIKit

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
