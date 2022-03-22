//
//  ItemModel.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 22/03/2022.
//

import Foundation

struct itemModel : Identifiable, Codable, Equatable {
    let id: String
    var descripcion: String
    var cantidad: Int
    
    
}
