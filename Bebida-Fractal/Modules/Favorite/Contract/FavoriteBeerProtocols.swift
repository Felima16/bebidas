//
//  FavoriteBeerProtocols.swift
//  Bebida-Fractal
//
//  Created by Fernanda de Lima on 15/12/2017.
//  Copyright © 2017 Empresinha. All rights reserved.
//

import UIKit
import RealmSwift

protocol FavoriteBeerViewProtocol: class {
    var presenter: FavoriteBeerPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showFavorites(with favorites: [FavoriteBeer])
    
    func showError()

}

protocol FavoriteBeerWireFrameProtocol: class {
    static func createFavoriteBeerModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentBeerDetailScreen(from view: FavoriteBeerViewProtocol, forFavor favorite: FavoriteBeer)
}

protocol FavoriteBeerPresenterProtocol: class {
    var view: FavoriteBeerViewProtocol? { get set }
    var interactor: FavoriteBeerInteractorInputProtocol? { get set }
    var wireFrame: FavoriteBeerWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showFavoriteDetail(forFavor favorite: FavoriteBeer)
}

protocol FavoriteBeerInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveBeers(_ favorites: [FavoriteBeer])
    func onError()
}

protocol FavoriteBeerInteractorInputProtocol: class {
    var presenter: FavoriteBeerInteractorOutputProtocol? { get set }
    var localDatamanager: FavoriteBeerLocalDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveFavoriteBeer()
}

protocol FavoriteBeerDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol FavoriteBeerLocalDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onBeersRetrieved(_ favorites: [FavoriteBeer])
    func onError()
}

protocol FavoriteBeerLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    func retrieveFavoriteBeer() throws -> Results<FavoriteBeer>
    func saveFavorite(tagLine: String, title: String, imageUrl: String, content: String) throws
    func deleteFavorite(favorite: FavoriteBeer)
}
