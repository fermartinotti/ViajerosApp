//
//  GastosModel.swift
//  ViajerosApp
//
//  Created by Agustin MacIa Del Rio on 16/03/2022.
//

import Foundation
import SwiftUIFontIcon
import FirebaseFirestore
import FirebaseFirestoreSwift

enum TipoDeGasto: String, Codable, CaseIterable {
    case COMPRAS
    case ENTRETENIMIENTO
    case GASTRONOMIA
    case SALUD
    case TRANSPORTE
}

struct GastosModel: Identifiable, Codable, Equatable {
    
    @DocumentID var id: String?
    var nombreGasto: String
    var fecha: Date
    var descripcion: String
    var importe: Double
    var tipoDeGasto: TipoDeGasto
    
    init(nombreGasto: String, fecha: Date, descripcion: String, importe: Double, tipoDeGasto: TipoDeGasto) {
        self.nombreGasto = nombreGasto
        self.fecha = fecha
        self.descripcion = descripcion
        self.importe = importe
        self.tipoDeGasto = tipoDeGasto
    }
}
