//
//  NewsModel.swift
//  LadoTsivtsivadze_28
//
//  Created by Ladolado3911 on 6/8/21.
//

import Foundation
import UIKit

class NewsModel {
    var news: News
    
    init(news obj: News) {
        news = obj
    }
    
    var imgUrl: URL? {
        URL(string: news.urlToImage ?? "")
    }
    
    var title: String {
        news.title ?? ""
    }
    
    var author: String {
        news.author ?? ""
    }
    
    var time: String {
        if let str = news.publishedAt {
            return String(str.suffix(9).dropLast())
        }
        else {
            return ""
        }
    }
}
