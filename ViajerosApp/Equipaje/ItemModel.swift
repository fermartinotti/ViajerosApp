//
//  ItemModel.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 22/03/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct itemModel : Identifiable, Codable, Equatable {
    @DocumentID var id: String?
    var descripcion: String
    var cantidad: Int
    var done:Bool = false
    
    init(descripcion:String, cantidad:Int){
        self.descripcion=descripcion
        self.cantidad=cantidad
        self.done=false
    }
    
}
