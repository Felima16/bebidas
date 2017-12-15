//
//  BeerListRemoteDataManager.swift
//  Bebida-Fractal
//
//  Created by Fernanda de Lima on 13/12/2017.
//  Copyright © 2017 Empresinha. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class BeerListRemoteDataManager:BeerListRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: BeerListRemoteDataManagerOutputProtocol?
    
    func retrieveBeerList() {
        Alamofire
            .request(Endpoints.Beers.list.url, method: .get)
            .validate()
            .responseArray(completionHandler: { (response: DataResponse<[Beer]>) in
                switch response.result {
                case .success(let beers):
                    print("==========> SAIDA")
                    print(beers)
                    self.remoteRequestHandler?.onBeersRetrieved(beers)
                    
                case .failure( _):
                    self.remoteRequestHandler?.onError()
                }
            })
    }
    
}
