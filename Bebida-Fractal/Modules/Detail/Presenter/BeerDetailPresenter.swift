//
//  BeerDetailPresenter.swift
//  Bebida-Fractal
//
//  Created by Fernanda de Lima on 13/12/2017.
//  Copyright © 2017 Empresinha. All rights reserved.
//

class BeerDetailPresenter: BeerDetailPresenterProtocol {
    
    weak var view: BeerDetailViewProtocol?
    var wireFrame: BeerDetailWireFrameProtocol?
    var beer: Beer?
    
    func viewDidLoad() {
        view?.showBeerDetail(forBeer: beer!)
    }
}
