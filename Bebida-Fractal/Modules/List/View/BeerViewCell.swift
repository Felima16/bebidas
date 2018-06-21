//
//  BeerViewCell.swift
//  Bebida-Fractal
//
//  Created by Fernanda de Lima on 13/12/2017.
//  Copyright © 2017 Empresinha. All rights reserved.
//

import UIKit
import AlamofireImage

class BeerViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tagLineLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBAction func favoriteAction(_ sender: Any) {
        if select{
            presenter?.deleteFavorite(forBeer: beer!)
            select = false
            favoriteButton.setImage(UIImage(named: "iconFav-a"), for: .normal)
        }else{
            presenter?.addFavorite(forBeer: beer!)
            select = true
            favoriteButton.setImage(UIImage(named: "iconFav-b"), for: .normal)
        }
    }
    
    var presenter : BeerListPresenterProtocol?
    var beer: Beer?
    var select: Bool = false
    
    func set(forBeer beer: Beer, presenter: BeerListPresenterProtocol) {
        self.selectionStyle = .none
        titleLabel?.text = beer.title
        tagLineLabel.text = beer.tagLine
        let url = URL(string: beer.imageUrl)!
        let placeholderImage = UIImage(named: "placeholder")!
        postImageView?.af_setImage(withURL: url, placeholderImage: placeholderImage)
        self.presenter = presenter
        self.beer = beer
        select = presenter.isFavorite(beer: beer)
        let image = select ? UIImage(named: "iconFav-b") : UIImage(named: "iconFav-a")
        favoriteButton.setImage(image, for: .normal)
    }
    
}
