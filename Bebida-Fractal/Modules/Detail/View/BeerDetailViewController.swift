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
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.topItem?.title = "Cervejas"
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
