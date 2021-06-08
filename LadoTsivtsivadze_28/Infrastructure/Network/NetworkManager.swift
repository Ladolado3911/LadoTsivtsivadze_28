//
//  API_Helper.swift
//  LadoTsivtsivadze_20
//
//  Created by Ladolado3911 on 5/27/21.
//

import Foundation
import UIKit


protocol NetworkManagerProtocol: AnyObject {
    func fetchData<T:Codable>(using endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void)
    
    
}

class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    private init() {}

    func fetchData<T:Codable>(using endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = endpoint.url else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let newData = data {
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: newData)
                    completion(.success(decoded))
                }
                catch {
                    print("Could not decode")
                    print(error)
                    completion(.failure(error))
                }
            }
            else {
                print("Could not unwrap data")
            }
        }.resume()
    }
}
