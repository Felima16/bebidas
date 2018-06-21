//
//  BeerListLocalDataManager.swift
//  Bebida-Fractal
//
//  Created by Fernanda de Lima on 13/12/2017.
//  Copyright © 2017 Empresinha. All rights reserved.
//

import Foundation
import RealmSwift

class FavoriteBeerLocalDataManager:FavoriteBeerLocalDataManagerInputProtocol, BeerListLocalDataManagerInputProtocol {
    
    var realm = try! Realm()
    lazy var favoriteBeer: Results<FavoriteBeer> = { self.realm.objects(FavoriteBeer.self)} ()
    
    
    func saveBeer(tagLine: String, title: String, imageUrl: String, content: String) throws {
        let favorite = FavoriteBeer()
        favorite.title = title
        favorite.tagLine = tagLine
        favorite.imageUrl = imageUrl
        favorite.content = content
        
        try! self.realm.write({
            self.realm.add(favorite)
        })
        
        favoriteBeer = realm.objects(FavoriteBeer.self)
    }
    
    func retrieveFavoriteBeer() throws -> Results<FavoriteBeer> {
        return favoriteBeer
    }
    
    func saveFavorite(tagLine: String, title: String, imageUrl: String, content: String) throws {
        let favorite = FavoriteBeer()
        favorite.title = title
        favorite.tagLine = tagLine
        favorite.imageUrl = imageUrl
        favorite.content = content
        
        try! self.realm.write({
            self.realm.add(favorite)
        })
        
        favoriteBeer = realm.objects(FavoriteBeer.self)
    }
    
    func deleteFavorite(favorite: Beer) {
        
        let favorList = favoriteBeer.filter("title = %@", favorite.title)
        let favor = favorList.first
        
        if let favor = favor{
            try! self.realm.write({
                self.realm.delete(favor)
            })
        }
    }
    
    func isFavorite(beer: Beer) -> Bool {
        return favoriteBeer.filter("title = %@ ", beer.title).count > 0 ? true : false
    }
    
}
