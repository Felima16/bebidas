//
//  FavoriteBeerInteractor.swift
//  Bebida-Fractal
//
//  Created by Fernanda de Lima on 15/12/2017.
//  Copyright © 2017 Empresinha. All rights reserved.
//

import Foundation

class FavoriteBeerInteractor: FavoriteBeerInteractorInputProtocol{
    weak var presenter: FavoriteBeerInteractorOutputProtocol?
    var localDatamanager: FavoriteBeerLocalDataManagerInputProtocol?
    
    func retrieveFavoriteBeer() {
        do {
            if let favoriteBeers = try localDatamanager?.retrieveFavoriteBeer() {
                var favoriteList: [FavoriteBeer] = []
                for f in favoriteBeers{
                    let favor = FavoriteBeer()
                    favor.tagLine = f.tagLine
                    favor.title = f.title
                    favor.content = f.content
                    favor.imageUrl = f.imageUrl
                    favoriteList.append(favor)
                }

                if favoriteList.isEmpty {
                    presenter?.didRetrieveBeers([])
                }else{
                    presenter?.didRetrieveBeers(favoriteList)
                }
            }
//            else {
//                remoteDatamanager?.retrievePostList()
//            }
            
        } catch {
            presenter?.didRetrieveBeers([])
        }
    }
    
}

extension FavoriteBeerInteractor: FavoriteBeerLocalDataManagerOutputProtocol {
    
    func onBeersRetrieved(_ favorites: [FavoriteBeer]) {
        presenter?.didRetrieveBeers(favorites)
    }
    
    func onError() {
        presenter?.onError()
    }
    
}

