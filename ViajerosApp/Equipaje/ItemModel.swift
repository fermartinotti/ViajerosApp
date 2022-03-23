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
    var done:Bool = false
    
    init(descripcion:String, cantidad:Int){
        id=UUID().uuidString
        self.descripcion=descripcion
        self.cantidad=cantidad
    }
    
}
