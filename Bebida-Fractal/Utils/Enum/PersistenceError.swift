//
//  PersistenceError.swift
//  Bebida-Fractal
//
//  Created by Fernanda de Lima on 13/12/2017.
//  Copyright © 2017 Empresinha. All rights reserved.
//

import Foundation

enum PersistenceError: Error {
    case couldNotSaveObject
    case objectNotFound
}
