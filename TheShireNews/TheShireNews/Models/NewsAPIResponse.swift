//
//  NewsAPIResponse.swift
//  TheShireNews
//
//  Created by student on 06/06/22.
//

import Foundation

struct NewsAPIResponse: Decodable {
    
    let status: String
    let totalResults: Int?
    let articles: [Article]?
    
    let code: String?
    let message: String?
    
}
