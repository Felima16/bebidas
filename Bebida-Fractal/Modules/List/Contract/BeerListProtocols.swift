//
//  BeerListProtocols.swift
//  Bebida-Fractal
//
//  Created by Fernanda de Lima on 13/12/2017.
//  Copyright © 2017 Empresinha. All rights reserved.
//

import UIKit

protocol BeerListViewProtocol: class {
    var presenter: BeerListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showBeers(with beers: [Beer])
    
    func showError()
    
    func showLoading()
    
    func hideLoading()
}

protocol BeerListWireFrameProtocol: class {
    static func createBeerListModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentBeerDetailScreen(from view: BeerListViewProtocol, forBeer beer: Beer)
}

protocol BeerListPresenterProtocol: class {
    var view: BeerListViewProtocol? { get set }
    var interactor: BeerListInteractorInputProtocol? { get set }
    var wireFrame: BeerListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showBeerDetail(forBeer beer: Beer)
    func addFavorite(forBeer favorite: Beer)
    func deleteFavorite(forBeer favorite: Beer)
    func isFavorite(beer: Beer) -> Bool
}

protocol BeerListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveBeers(_ beers: [Beer])
    func onError()
}

protocol BeerListInteractorInputProtocol: class {
    var presenter: BeerListInteractorOutputProtocol? { get set }
    var localDatamanager: BeerListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: BeerListRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveBeerList()
    func saveFavorite(beer: Beer)
    func deleteFavorite(favorite: FavoriteBeer)
    func isFavorite(beer: Beer) -> Bool
}

protocol BeerListDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol BeerListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: BeerListRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrieveBeerList()
}

protocol BeerListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onBeersRetrieved(_ beers: [Beer])
    func onError()
}

protocol BeerListLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    func saveBeer(tagLine: String, title: String, imageUrl: String, content: String) throws
    func deleteFavorite(favorite: FavoriteBeer)
    func isFavorite(beer: Beer) -> Bool
}

