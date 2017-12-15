//
//  FavoriteViewCell.swift
//  Bebida-Fractal
//
//  Created by Fernanda de Lima on 15/12/2017.
//  Copyright © 2017 Empresinha. All rights reserved.
//

import UIKit

class FavoriteViewCell: UITableViewCell {
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tagLineLabel: UILabel!
    @IBOutlet weak var favoriteImage: UIImageView!

    func set(forFavor favorite: FavoriteBeer) {
        self.selectionStyle = .none
        titleLabel?.text = favorite.title
        tagLineLabel.text = favorite.tagLine
        let url = URL(string: favorite.imageUrl)!
        let placeholderImage = UIImage(named: "placeholder")!
        postImageView?.af_setImage(withURL: url, placeholderImage: placeholderImage)
    }
}
