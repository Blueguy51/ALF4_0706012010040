//
//  API.swift
//  ShireNews
//
//  Created by student on 30/05/22.
//

import Foundation
final class API {
    static let shared = API()
    
    struct Constants {
        static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=id&apiKey=bfcdf9217453414b8bcf30e43e904f60")
    }
    private init(){}
    
    public func getHeadline(completion: @escaping (Result<[String], Error>) -> Void) {
        guard let url = Constants.topHeadlinesURL else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponses.self, from: data)
                    
                    print("Articles: \(result.articles.count)")
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}

//models

struct APIResponses: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
}

struct Source: Codable {
    let name: String
}
