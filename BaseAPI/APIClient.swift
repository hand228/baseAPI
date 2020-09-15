//
//  APIClient.swift
//  BaseAPI
//
//  Created by HaND on 9/15/20.
//  Copyright © 2020 Rikkeisoft. All rights reserved.
//

import Foundation
enum APIError: Error {
    case noData
}
class APIClient<T: Codable> {
    var request: URLRequest { get }
    func execute() {
        let urlSession = URLSession.shared
        urlSession.dataTask(with: self.request, completionHandler: { data, response, error in
            guard let data = data else {
                Result<T, APIError>.failure(APIError.noData)
            }
            JSONDecoder().decode(T.self, from: data)
        })
    }
}
