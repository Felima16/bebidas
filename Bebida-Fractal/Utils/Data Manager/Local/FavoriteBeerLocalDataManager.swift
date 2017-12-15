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
    
    var favoriteBeer: Results<FavoriteBeer> {
        get {
            return realm.objects(FavoriteBeer.self)
        }
    }
    
    func saveBeer(tagLine: String, title: String, imageUrl: String, content: String) throws {
        let favorite = FavoriteBeer()
        favorite.title = title
        favorite.tagLine = tagLine
        favorite.imageUrl = imageUrl
        favorite.content = content
        
        try! self.realm.write({
            self.realm.add(favorite)
        })
    }
    
    func retrieveFavoriteBeer() throws -> Results<FavoriteBeer> {
        
//        realm = try! Realm()
        
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
    }
    
    func deleteFavorite(favorite: FavoriteBeer) {
        if favoriteBeer.contains(favorite){
            try! self.realm.write({
                self.realm.delete(favorite)
            })
        }
    }
    
}
