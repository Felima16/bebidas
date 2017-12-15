//
//  Endpoints.swift
//  Bebida-Fractal
//
//  Created by Fernanda de Lima on 13/12/2017.
//  Copyright © 2017 Empresinha. All rights reserved.
//

import Foundation

import Foundation

struct API {
    static let baseUrl = "https://api.punkapi.com/v2/"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum Beers: Endpoint {
        case list
        
        public var path: String {
            switch self {
            case .list: return "/beers"
            }
        }
        
        public var url: String {
            switch self {
            case .list: return "\(API.baseUrl)\(path)"
            }
        }
    }
}
