//
//  FavoriteBeer.swift
//  Bebida-Fractal
//
//  Created by Fernanda de Lima on 15/12/2017.
//  Copyright © 2017 Empresinha. All rights reserved.
//

import RealmSwift

class FavoriteBeer: Object {
    @objc dynamic var title = ""
    @objc dynamic var tagLine = ""
    @objc dynamic var content = ""
    @objc dynamic var imageUrl = ""
}
