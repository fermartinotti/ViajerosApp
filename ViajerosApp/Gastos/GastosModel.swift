//
//  GastosModel.swift
//  ViajerosApp
//
//  Created by Agustin MacIa Del Rio on 16/03/2022.
//

import Foundation

enum tipoDeGasto: Codable {
    
    case COMPRAS
    case ENTRETENIMIENTO
    case GASTRONOMIA
    case SALUD
    case TRANSPORTE
}

struct GastosModel: Identifiable, Codable {
    
    let id: String
    let nombreGasto: String
    let fecha: Date
    let descripcion: String
    let tipoDeGasto: tipoDeGasto
    
    init(nombreGasto: String, fecha: Date, descripcion: String, tipoDeGasto: tipoDeGasto) {
        id = UUID().uuidString
        self.nombreGasto = nombreGasto
        self.fecha = fecha
        self.descripcion = descripcion
        self.tipoDeGasto = tipoDeGasto
    }
}
