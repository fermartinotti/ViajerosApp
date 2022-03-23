//
//  GastosModel.swift
//  ViajerosApp
//
//  Created by Agustin MacIa Del Rio on 16/03/2022.
//

import Foundation

enum TipoDeGasto: Codable {
    
    case COMPRAS
    case ENTRETENIMIENTO
    case GASTRONOMIA
    case SALUD
    case TRANSPORTE
}

struct GastosModel: Identifiable, Codable, Equatable {
    
    let id: String
    var nombreGasto: String
    var fecha: Date
    var descripcion: String
    var importe: Double
    var tipoDeGasto: TipoDeGasto
    
    init(nombreGasto: String, fecha: Date, descripcion: String, importe: Double, tipoDeGasto: TipoDeGasto) {
        id = UUID().uuidString
        self.nombreGasto = nombreGasto
        self.fecha = fecha
        self.descripcion = descripcion
        self.importe = importe
        self.tipoDeGasto = tipoDeGasto
    }
}
