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
    let searchController = UISearchController(searchResultsController: nil)
    var presenter : BeerListPresenterProtocol?
    var listBeer: [Beer] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        self.beerTableView.rowHeight = UITableViewAutomaticDimension
        self.beerTableView.estimatedRowHeight = 90
    }
    
    func configSearchBar(){
        self.searchController.searchResultsUpdater = self
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.placeholder = "Pesquisar Competência"
//        let scb = searchController.searchBar
//        scb.tintColor = .white
        self.navigationController?.navigationItem.searchController = searchController
        self.definesPresentationContext = true
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}

extension BeerListViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        print("manda pra algum lugar")
    }
    
    
}
