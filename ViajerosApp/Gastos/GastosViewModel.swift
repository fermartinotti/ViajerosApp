//
//  GastosViewModel.swift
//  ViajerosApp
//
//  Created by Agustin MacIa Del Rio on 16/03/2022.
//

import Foundation
import SwiftUI

class GastosViewModel: ObservableObject {
    
    @Published var misGastos : [GastosModel] = []
    
    init() {
        //Cargar gastos pa cuando inicie la app
        misGastos.append(GastosModel(nombreGasto: "Coca Cola", fecha: Date.now, descripcion: "Esto es un descripcion del gasto", tipoDeGasto: tipoDeGasto.COMPRAS))
        misGastos.append(GastosModel(nombreGasto: "Subte", fecha: Date.now, descripcion: "Esto es un descripcion del gasto", tipoDeGasto: tipoDeGasto.TRANSPORTE))
        misGastos.append(GastosModel(nombreGasto: "Ibuprofeno", fecha: Date.now, descripcion: "Esto es un descripcion del gasto", tipoDeGasto: tipoDeGasto.SALUD))
        misGastos.append(GastosModel(nombreGasto: "Entradas cine", fecha: Date.now, descripcion: "Esto es un descripcion del gasto", tipoDeGasto: tipoDeGasto.ENTRETENIMIENTO))
    }
    
    func agregarGasto() {
        
    }
    
    func eliminarGasto() {
        
    }
    
    func editarGasto() {
        
    }
    
    func cargarGastos() {
        
    }
}
