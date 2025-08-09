//
//  Network_manager.swift
//  Nandakrishna-Api_project
//
//  Created by Nxt Wave mac mini 3 on 07/08/25.
//

import SwiftUI

enum APError: Error {
    case easy
    case medium
    case hard
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    static let  baseURL = "https://dummyjson.com/recipes"
    
    private init() { }
       
    
    func getAppetizers() async throws -> [Recipe] {
        
        guard let url = URL(string : NetworkManager.baseURL) else {
            throw APError.medium
        }

        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
                let decoder = JSONDecoder()
                return try decoder.decode(Welcome.self, from: data).recipes
            } catch {
                throw APError.easy
            }
        }
    

    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}



