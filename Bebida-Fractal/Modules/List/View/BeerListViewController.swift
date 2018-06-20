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
    var filteredBeers: [Beer] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        self.beerTableView.rowHeight = UITableViewAutomaticDimension
        self.beerTableView.estimatedRowHeight = 90
        
        configSearchBar()
    }
    
    func configSearchBar(){
        
        self.searchController.searchResultsUpdater = self
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.placeholder = "Search"
        
        let scb = searchController.searchBar
        scb.tintColor = .white
        scb.barTintColor = .white
        
        if let txt = scb.value(forKey: "searchField") as? UITextField{
            txt.textColor = .white
            if let bg = txt.subviews.first{
                bg.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
                bg.layer.cornerRadius = 10
                bg.clipsToBounds = true
                bg.tintColor = .white
            }
        }
        
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = true
        searchController.isActive = true
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredBeers = listBeer.filter({( beer : Beer) -> Bool in
            return beer.title.lowercased().contains(searchText.lowercased())
        })
        
        beerTableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
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
        if isFiltering() {
            return filteredBeers.count
        }
        
        return listBeer.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "beerCell") as? BeerViewCell else {
            return UITableViewCell()
        }
        
        let beer:Beer
        
        if isFiltering() {
            beer = filteredBeers[indexPath.row]
        } else {
            beer = listBeer[indexPath.row]
        }
        //        let beer = listBeer[indexPath.row]
        cell.set(forBeer: beer, presenter: self.presenter!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let beer:Beer
        
        if isFiltering() {
            beer = filteredBeers[indexPath.row]
        } else {
            beer = listBeer[indexPath.row]
        }
        
        presenter?.showBeerDetail(forBeer: beer)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}

extension BeerListViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}


