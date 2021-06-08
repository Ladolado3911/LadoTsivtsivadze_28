//
//  Endpoints.swift
//  LadoTsivtsivadze_28
//
//  Created by Ladolado3911 on 6/8/21.
//

import Foundation
import UIKit


enum Endpoint: String {
    case news = "https://newsapi.org/v2/everything?q=tesla&from=2021-05-08&sortBy=publishedAt&apiKey=019d667ba0e54cd0994ac1cc222ad2ab"
    
    var url: URL? {
        return URL(string: self.rawValue)
    }
}
