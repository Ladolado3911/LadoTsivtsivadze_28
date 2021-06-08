//
//  NewsViewModel.swift
//  LadoTsivtsivadze_28
//
//  Created by Ladolado3911 on 6/8/21.
//

import Foundation
import UIKit


protocol NewsViewModelProtocol: AnyObject {
    init(newsManager distr: DataDistributor)
    
    func fetchData(completion: @escaping ([NewsModel]) -> Void)
}


final class NewsViewModel: NewsViewModelProtocol {
    
    var newsManager: DataDistributor
    
    init(newsManager distr: DataDistributor) {
        newsManager = distr
        
    }
    
    func fetchData(completion: @escaping ([NewsModel]) -> Void) {
        newsManager.getNews { (newsArr) in
            DispatchQueue.main.async {
                completion(newsArr)
            }
        }
    }
}
