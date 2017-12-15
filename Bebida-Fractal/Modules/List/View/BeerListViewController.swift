//
//  ListBeerViewController.swift
//  Bebida-Fractal
//
//  Created by Fernanda de Lima on 12/12/2017.
//  Copyright © 2017 Empresinha. All rights reserved.
//

import UIKit

class BeerListViewController: UIViewController {

    @IBOutlet weak var beerTableView: UITableView!
    var presenter : BeerListPresenterProtocol?
    var listBeer: [Beer] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        self.beerTableView.rowHeight = UITableViewAutomaticDimension
        self.beerTableView.estimatedRowHeight = 90
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension BeerListViewController : BeerListViewProtocol{
    func showBeers(with beers: [Beer]) {
        listBeer = beers
        beerTableView.reloadData()
    }
    
    func showError() {
        //mostra erro
    }
    
    func showLoading() {
        //mostra progress
    }
    
    func hideLoading() {
        //esconder
    }
    
    
    func reloadInterface(_ beers: [Beer]){
        self.listBeer = beers
        self.beerTableView.reloadData()
    }
}

extension BeerListViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listBeer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "beerCell") as? BeerViewCell else {
            return UITableViewCell()
        }
        
        let beer = listBeer[indexPath.row]
        cell.set(forBeer: beer, presenter: self.presenter!)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showBeerDetail(forBeer: listBeer[indexPath.row])
    }
    
}
