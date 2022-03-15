//
//  TransporteModel.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 15/03/2022.
//

import Foundation

struct transporteModel : Identifiable,Codable{
    let id: String
    var origen:String
    var destingo:String
    var fechaSalida:Date
    var fechaLlegada:Date
    var codigoViaje:String
    
    init(origen:String, destino:String, fechaSalida:Date, fechaLlegada:Date, codigoViaje:String){
        id=UUID().uuidString
        self.origen=origen
        self.destingo=destino
        self.fechaSalida=fechaSalida
        self.fechaLlegada=fechaLlegada
        self.codigoViaje=codigoViaje
    }
    
}
