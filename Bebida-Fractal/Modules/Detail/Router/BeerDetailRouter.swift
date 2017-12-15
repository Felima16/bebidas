//
//  BeerDetailRouter.swift
//  Bebida-Fractal
//
//  Created by Fernanda de Lima on 13/12/2017.
//  Copyright © 2017 Empresinha. All rights reserved.
//

import UIKit

class BeerDetailRouter: BeerDetailWireFrameProtocol {
    
    class func createBeerDetailModule(forBeer beer: Beer) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "BeerDetailController")
        if let view = viewController as? BeerDetailViewController {
            let presenter: BeerDetailPresenterProtocol = BeerDetailPresenter()
            let wireFrame: BeerDetailWireFrameProtocol = BeerDetailRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.beer = beer
            presenter.wireFrame = wireFrame
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
}


