//
//  BeerListInteractor.swift
//  Bebida-Fractal
//
//  Created by Fernanda de Lima on 13/12/2017.
//  Copyright © 2017 Empresinha. All rights reserved.
//

import Foundation

class BeerListInteractor: BeerListInteractorInputProtocol{
    weak var presenter: BeerListInteractorOutputProtocol?
    var remoteDatamanager: BeerListRemoteDataManagerInputProtocol?
    var localDatamanager: BeerListLocalDataManagerInputProtocol?
    
    func retrieveBeerList() {
        do {
            remoteDatamanager?.retrieveBeerList()
            
        } catch {
            presenter?.didRetrieveBeers([])
        }
    }
    
    func saveFavorite(beer: Beer){
        try! localDatamanager?.saveBeer(tagLine: beer.tagLine, title: beer.title, imageUrl: beer.imageUrl, content: beer.content)
    }
    
    func deleteFavorite(favorite beer: Beer){
        localDatamanager?.deleteFavorite(favorite: beer)
    }
    
    func isFavorite(beer:Beer) -> Bool{
        return (localDatamanager?.isFavorite(beer: beer))!
    }
    
}

extension BeerListInteractor: BeerListRemoteDataManagerOutputProtocol {
    
    func onBeersRetrieved(_ beers: [Beer]) {
        presenter?.didRetrieveBeers(beers)
    }
    
    func onError() {
        presenter?.onError()
    }
    
}

