//
//  APIManager.swift
//  SampleAPI
//
//  Created by Admin on 08/11/21.
//

import Foundation
import UIKit

enum APIError: Error {
    case invalidUrl
    case errorDecode
    case failed(error: Error)
    case unknownError
}

struct APIManager {
    static let shared = APIManager()
    
    func getProfiles(perPage: Int = 30, sinceId: Int? = nil, completion: @escaping (Result<[ProfileStruct], APIError>) -> Void) {
        // 4
        var components = URLComponents(string: "https://api.github.com/users")!
        components.queryItems = [
            URLQueryItem(name: "per_page", value: "\(perPage)"),
            URLQueryItem(name: "since", value: (sinceId != nil) ? "\(sinceId!)" : "")
        ]
        
        guard let url = components.url else {
            completion(.failure(.invalidUrl))
            return
        }
        // 3
        
        let urlRequest = URLRequest(url: url, timeoutInterval: 10)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error  in
            if error != nil {
                print("dataTask error: \(error!.localizedDescription)")
                completion(.failure(.failed(error: error!)))
            } else if let data = data {
                // Success request
                do {
                    // 4. Decode json into array of User
                    let users = try JSONDecoder().decode([ProfileStruct].self, from: data)
                    print("success")
                    completion(.success(users))
                } catch {
                    // Send error when decoding
                    print("decoding error")
                    completion(.failure(.errorDecode))
                }
            } else {
                print("unknown dataTask error")
                completion(.failure(.unknownError))
            }
        }
        .resume()
    }
    
}
