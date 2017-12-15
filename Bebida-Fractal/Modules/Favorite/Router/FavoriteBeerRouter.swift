//
//  FavoriteBeerRouter.swift
//  Bebida-Fractal
//
//  Created by Fernanda de Lima on 15/12/2017.
//  Copyright © 2017 Empresinha. All rights reserved.
//

import UIKit

class FavoriteBeerRouter: FavoriteBeerWireFrameProtocol {
    
    class func createFavoriteBeerModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "FavoritesNavigationController")
        if let view = navController.childViewControllers.first as? FavoriteBeerViewController {
            let presenter: FavoriteBeerPresenterProtocol & FavoriteBeerInteractorOutputProtocol = FavoriteBeerPresenter()
            let interactor: FavoriteBeerInteractorInputProtocol & FavoriteBeerLocalDataManagerOutputProtocol = FavoriteBeerInteractor()
            let localDataManager: FavoriteBeerLocalDataManagerInputProtocol = FavoriteBeerLocalDataManager()
            let wireFrame: FavoriteBeerWireFrameProtocol = FavoriteBeerRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    
    func presentBeerDetailScreen(from view: FavoriteBeerViewProtocol, forFavor favorite: FavoriteBeer) {
        
        let beer = Beer(favorite.title, favorite.tagLine, favorite.content, favorite.imageUrl)
        let beerDetailViewController = BeerDetailRouter.createBeerDetailModule(forBeer: beer)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(beerDetailViewController, animated: true)
        }
    }
    
}

