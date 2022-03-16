//
//  TransporteModel.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 15/03/2022.
//

import Foundation

enum TipoDeViaje: Encodable, Decodable {
    case AVION
    case BARCO
    case TREN
}

struct transporteModel : Identifiable,Encodable,Decodable{
    let id: String
    var origen:String
    var destino:String
    var fechaSalida:Date
    var fechaLlegada:Date
    var codigoViaje:String
    var tipoDeViaje:TipoDeViaje
    
    init(origen:String, destino:String, fechaSalida:Date, fechaLlegada:Date, codigoViaje:String, tipoDeViaje:TipoDeViaje){
        id=UUID().uuidString
        self.origen=origen
        self.destino=destino
        self.fechaSalida=fechaSalida
        self.fechaLlegada=fechaLlegada
        self.codigoViaje=codigoViaje
        self.tipoDeViaje=tipoDeViaje
    }
    
}
