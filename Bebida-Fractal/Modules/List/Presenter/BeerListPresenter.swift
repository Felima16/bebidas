//
//  BeerListPresenter.swift
//  Bebida-Fractal
//
//  Created by Fernanda de Lima on 13/12/2017.
//  Copyright © 2017 Empresinha. All rights reserved.
//

import Foundation

class BeerListPresenter: BeerListPresenterProtocol{
    weak var view: BeerListViewProtocol?
    var interactor: BeerListInteractorInputProtocol?
    var wireFrame: BeerListWireFrameProtocol?
    
    func viewDidLoad(){
        view?.showLoading()
        interactor?.retrieveBeerList()
    }
    
    func showBeerDetail(forBeer beer: Beer){
        wireFrame?.presentBeerDetailScreen(from: view!, forBeer: beer)
    }
    
    func addFavorite(forBeer favorite: Beer){
        interactor?.saveFavorite(beer: favorite)
    }
    
    func deleteFavorite(forBeer favorite: Beer){
        let favor = FavoriteBeer()
        favor.content = favorite.content
        favor.tagLine = favorite.tagLine
        favor.imageUrl = favorite.imageUrl
        favor.title = favorite.title
        interactor?.deleteFavorite(favorite: favor)
    }
}

extension BeerListPresenter: BeerListInteractorOutputProtocol {
    
    func didRetrieveBeers(_ beers: [Beer]) {
        view?.hideLoading()
        view?.showBeers(with: beers)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
    
}

