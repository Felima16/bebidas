//
//  BeerListRouter.swift
//  Bebida-Fractal
//
//  Created by Fernanda de Lima on 13/12/2017.
//  Copyright © 2017 Empresinha. All rights reserved.
//

import UIKit

class BeerListRouter: BeerListWireFrameProtocol {
    
    class func createBeerListModule() -> UIViewController {
        let tabController = mainStoryboard.instantiateViewController(withIdentifier: "BeersTabBarController")
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "BeersNavigationController")
        tabController.addChildViewController(navController)
        if let view = navController.childViewControllers.first as? BeerListViewController {
            let presenter: BeerListPresenterProtocol & BeerListInteractorOutputProtocol = BeerListPresenter()
            let interactor: BeerListInteractorInputProtocol & BeerListRemoteDataManagerOutputProtocol = BeerListInteractor()
            let localDataManager: BeerListLocalDataManagerInputProtocol = FavoriteBeerLocalDataManager()
            let remoteDataManager: BeerListRemoteDataManagerInputProtocol = BeerListRemoteDataManager()
            let wireFrame: BeerListWireFrameProtocol = BeerListRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return tabController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    
    func presentBeerDetailScreen(from view: BeerListViewProtocol, forBeer beer: Beer) {
        let beerDetailViewController = BeerDetailRouter.createBeerDetailModule(forBeer: beer)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(beerDetailViewController, animated: true)
        }
    }
    
}
