//
//  GastosViewModel.swift
//  ViajerosApp
//
//  Created by Agustin MacIa Del Rio on 16/03/2022.
//

import Foundation

class GastosViewModel: ObservableObject {
    
    @Published var misGastos : [GastosModel] = []
    
    init() {
        cargarGastos()
    }
    
    func agregarGasto(nombreGasto: String, fecha: Date, descripcion: String, importe: Double, tipoDeGasto: TipoDeGasto) {
        let nuevoGasto = GastosModel(nombreGasto: nombreGasto, fecha: fecha, descripcion: descripcion, importe: importe, tipoDeGasto: tipoDeGasto)
        misGastos.append(nuevoGasto)
        guardarGastos()
    }
    
    func eliminarGasto(gasto: GastosModel) {
        if let index = misGastos.firstIndex(of: gasto) {
            misGastos.remove(at: index)
        }
    }
    
    func editarGasto(_ id: String, nuevoNombreGasto: String, nuevaFecha: Date, nuevaDescripcion: String, nuevoImporte: Double, nuevoTipoDeGasto: TipoDeGasto) {
        
        let gastoAActualizar = misGastos.firstIndex(where: { $0.id == id})
        print("Hola llegue a la funcion")
        if let posicionGasto = gastoAActualizar {
            misGastos[posicionGasto].nombreGasto = nuevoNombreGasto
            misGastos[posicionGasto].fecha = nuevaFecha
            misGastos[posicionGasto].descripcion = nuevaDescripcion
            misGastos[posicionGasto].importe = nuevoImporte
            misGastos[posicionGasto].tipoDeGasto = nuevoTipoDeGasto
            
            guardarGastos()
        }
    }
    
    func guardarGastos() {
        if let gastosEncoded = try? JSONEncoder().encode(misGastos) {
            UserDefaults.standard.set(gastosEncoded, forKey: "Gastos")
        }
    }
    
    func cargarGastos() {
        if let gastosGuardados = UserDefaults.standard.object(forKey: "Gastos") as? Data {
            if var gastosDecodificados = try? JSONDecoder().decode([GastosModel].self, from: gastosGuardados) {
                misGastos = gastosDecodificados
            }
        }
    }
    
}
