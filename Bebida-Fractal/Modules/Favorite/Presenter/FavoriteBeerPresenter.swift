//
//  FavoriteBeerPresenter.swift
//  Bebida-Fractal
//
//  Created by Fernanda de Lima on 15/12/2017.
//  Copyright © 2017 Empresinha. All rights reserved.
//

import Foundation

class FavoriteBeerPresenter: FavoriteBeerPresenterProtocol{
    weak var view: FavoriteBeerViewProtocol?
    var interactor: FavoriteBeerInteractorInputProtocol?
    var wireFrame: FavoriteBeerWireFrameProtocol?
    
    func viewDidLoad(){
        interactor?.retrieveFavoriteBeer()
    }
    
    func showFavoriteDetail(forFavor favorite: FavoriteBeer){
        wireFrame?.presentBeerDetailScreen(from: view!, forFavor: favorite)
    }
}

extension FavoriteBeerPresenter: FavoriteBeerInteractorOutputProtocol {
    
    func didRetrieveBeers(_ favorites: [FavoriteBeer]) {
        view?.showFavorites(with: favorites)
    }
    
    func onError() {
        view?.showError()
    }
    
}
