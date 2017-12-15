//
//  FavoriteBeerViewController.swift
//  Bebida-Fractal
//
//  Created by Fernanda de Lima on 15/12/2017.
//  Copyright © 2017 Empresinha. All rights reserved.
//

import UIKit

class FavoriteBeerViewController: UIViewController {

    @IBOutlet weak var favoriteTableView: UITableView!
    var presenter : FavoriteBeerPresenterProtocol?
    var listFavorite: [FavoriteBeer] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        self.favoriteTableView.rowHeight = UITableViewAutomaticDimension
        self.favoriteTableView.estimatedRowHeight = 90
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.favoriteTableView.reloadData()
    }

}

extension FavoriteBeerViewController : FavoriteBeerViewProtocol{

    func showFavorites(with favorites: [FavoriteBeer]) {
        listFavorite = favorites
        favoriteTableView.reloadData()
    }
    
    func reloadInterface(_ favorites: [FavoriteBeer]){
        self.listFavorite = favorites
        self.favoriteTableView.reloadData()
    }
    
    func showError() {
        //mostra erro
    }
}

extension FavoriteBeerViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(listFavorite.count)
        return listFavorite.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell") as? FavoriteViewCell else {
            return UITableViewCell()
        }
        
        let favorite = listFavorite[indexPath.row]
        cell.set(forFavor: favorite)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showFavoriteDetail(forFavor: listFavorite[indexPath.row])
    }
}
