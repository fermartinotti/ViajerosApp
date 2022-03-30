//
//  TransporteModel.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 15/03/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

enum TipoDeViaje: String, Codable, CaseIterable{
    case AVION
    case BARCO
    case TREN
}

struct transporteModel : Identifiable,Encodable,Decodable, Equatable{
    @DocumentID var id: String?
    var origen:String
    var destino:String
    var fechaSalida:Date
    var fechaLlegada:Date
    var codigoViaje:String
    var tipoDeViaje:TipoDeViaje
    
    init(origen:String, destino:String, fechaSalida:Date, fechaLlegada:Date, codigoViaje:String, tipoDeViaje:TipoDeViaje){
        self.origen=origen
        self.destino=destino
        self.fechaSalida=fechaSalida
        self.fechaLlegada=fechaLlegada
        self.codigoViaje=codigoViaje
        self.tipoDeViaje=tipoDeViaje
    }
    
}
