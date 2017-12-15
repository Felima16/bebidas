//
//  BeerModel.swift
//  Bebida-Fractal
//
//  Created by Fernanda de Lima on 12/12/2017.
//  Copyright © 2017 Empresinha. All rights reserved.
//

import Foundation
import ObjectMapper

struct Beer {
    var title = ""
    var tagLine = ""
    var content = ""
    var imageUrl = ""
    
    init(_ title:String,_ tagLine: String,_ content:String,_ imageUrl:String) {
        self.title = title
        self.tagLine = tagLine
        self.content = content
        self.imageUrl = imageUrl
    }
}

extension Beer: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        title       <- map["name"]
        tagLine     <- map["tagline"]
        content     <- map["description"]
        imageUrl    <- map["image_url"]
    }
}
