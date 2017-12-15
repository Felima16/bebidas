//
//  BeerDetailProtocols.swift
//  Bebida-Fractal
//
//  Created by Fernanda de Lima on 13/12/2017.
//  Copyright © 2017 Empresinha. All rights reserved.
//

import UIKit

protocol BeerDetailViewProtocol: class {
    var presenter: BeerDetailPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showBeerDetail(forBeer beer: Beer)
}

protocol BeerDetailWireFrameProtocol: class {
    static func createBeerDetailModule(forBeer beer: Beer) -> UIViewController
}

protocol BeerDetailPresenterProtocol: class {
    var view: BeerDetailViewProtocol? { get set }
    var wireFrame: BeerDetailWireFrameProtocol? { get set }
    var beer: Beer? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
}
