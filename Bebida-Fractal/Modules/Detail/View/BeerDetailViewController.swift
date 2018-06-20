//
//  BeerDetailViewController.swift
//  Bebida-Fractal
//
//  Created by Fernanda de Lima on 13/12/2017.
//  Copyright © 2017 Empresinha. All rights reserved.
//

import UIKit

class BeerDetailViewController: UIViewController {

    @IBOutlet weak var beerDetailImage: UIImageView!
    @IBOutlet weak var tagLineDetailLabel: UILabel!
    @IBOutlet weak var contentText: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var presenter: BeerDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2901960784, green: 0.5647058824, blue: 0.8862745098, alpha: 1)
        self.navigationController?.navigationBar.tintColor = .white
    }
    
}

extension BeerDetailViewController: BeerDetailViewProtocol {
    
    func showBeerDetail(forBeer beer: Beer) {
        titleLabel.text = beer.title
        tagLineDetailLabel?.text = beer.tagLine
        contentText.text = beer.content
        let url = URL(string: beer.imageUrl)!
        let placeholderImage = UIImage(named: "placeholder")!
        beerDetailImage?.af_setImage(withURL: url, placeholderImage: placeholderImage)
    }
    
}
