//
//  InicioModel.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 23/03/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct InicioModel: Identifiable, Codable{
    @DocumentID var id: String?
    var fechaDeViaje:Date
    var lugarDeViaje:String
    
    init(fechaDeViaje:Date, lugarDeViaje:String){
        self.fechaDeViaje = fechaDeViaje
        self.lugarDeViaje = lugarDeViaje
    }
}
