//
//  Data.swift
//  LadoTsivtsivadze_25
//
//  Created by Ladolado3911 on 6/3/21.
//

import Foundation
import UIKit


class DataDistributor {
    
    static var shared = DataDistributor()
    private init() {}
 
    func getNews(completion: @escaping ([NewsModel]) -> Void) {
        NetworkManager.shared.fetchData(using: .news) { (result: Result<NewsResponse, Error>) in
            switch result {
            case .success(let news):
                completion(news.articles.map { NewsModel(news: $0) })
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
