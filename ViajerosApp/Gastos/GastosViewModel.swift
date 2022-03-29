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
        //Cargar gastos pa cuando inicie la app
        misGastos.append(GastosModel(nombreGasto: "Coca Cola", fecha: Date.now, descripcion: "Esto es un descripcion del gasto", importe: 100.00, tipoDeGasto: TipoDeGasto.COMPRAS))
        misGastos.append(GastosModel(nombreGasto: "Leche", fecha: Date.now.addingTimeInterval(86400), descripcion: "Esto es un descripcion del gasto", importe: 100.00, tipoDeGasto: TipoDeGasto.COMPRAS))
        misGastos.append(GastosModel(nombreGasto: "Pan", fecha: Date.now, descripcion: "Esto es un descripcion del gasto", importe: 100.00, tipoDeGasto: TipoDeGasto.COMPRAS))
        misGastos.append(GastosModel(nombreGasto: "Papas", fecha: Date.now, descripcion: "Esto es un descripcion del gasto", importe: 100.00, tipoDeGasto: TipoDeGasto.GASTRONOMIA))
        misGastos.append(GastosModel(nombreGasto: "Manteca", fecha: Date.now, descripcion: "Esto es un descripcion del gasto", importe: 100.00, tipoDeGasto: TipoDeGasto.COMPRAS))
        misGastos.append(GastosModel(nombreGasto: "Fideos", fecha: Date.now, descripcion: "Esto es un descripcion del gasto", importe: 100.00, tipoDeGasto: TipoDeGasto.COMPRAS))
        misGastos.append(GastosModel(nombreGasto: "Subte", fecha: Date.now, descripcion: "Esto es un descripcion del gasto", importe: 30.00, tipoDeGasto: TipoDeGasto.TRANSPORTE))
        misGastos.append(GastosModel(nombreGasto: "Ibuprofeno", fecha: Date.now, descripcion: "Esto es un descripcion del gasto", importe: 70.00, tipoDeGasto: TipoDeGasto.SALUD))
        misGastos.append(GastosModel(nombreGasto: "Entradas cine", fecha: Date.now, descripcion: "Esto es un descripcion del gasto", importe: 10000.00, tipoDeGasto: TipoDeGasto.ENTRETENIMIENTO))
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
                gastosDecodificados.sort{ $0.fecha.compare($1.fecha) == .orderedDescending}
                misGastos = gastosDecodificados
            }
        }
    }
    
}
