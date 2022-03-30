//
//  GastosViewModel.swift
//  ViajerosApp
//
//  Created by Agustin MacIa Del Rio on 16/03/2022.
//

import Foundation

import FirebaseFirestoreSwift
import FirebaseFirestore

class GastosViewModel: ObservableObject {
    
    @Published var misGastos : [GastosModel] = []
    private var database = Firestore.firestore()
    
    init() {
        getAllExpenses()
    }
    
//    func agregarGasto(nombreGasto: String, fecha: Date, descripcion: String, importe: Double, tipoDeGasto: TipoDeGasto) {
//        let nuevoGasto = GastosModel(nombreGasto: nombreGasto, fecha: fecha, descripcion: descripcion, importe: importe, tipoDeGasto: tipoDeGasto)
//        misGastos.append(nuevoGasto)
//        guardarGastos()
//    }
    
    func createExpense(nombreGasto: String, fecha: Date, descripcion: String, importe: Double, tipoDeGasto: TipoDeGasto) {
        let nuevoGasto = GastosModel(nombreGasto: nombreGasto, fecha: fecha, descripcion: descripcion, importe: importe, tipoDeGasto: tipoDeGasto)
        do {
            _ = try database.collection("gastos").addDocument(from: nuevoGasto)
        } catch {
            print("No se pudo crear un nuevo gasto. \(error)")
        }
    }
    
    func deleteExpense(_ gastoAEliminar: GastosModel) {
        database.collection("gastos").document(gastoAEliminar.id!).delete()
    }
//
//    func eliminarGasto(gasto: GastosModel) {
//        if let index = misGastos.firstIndex(of: gasto) {
//            misGastos.remove(at: index)
//        }
//    }
    
    func editExpense(_ id: String, nuevoNombreGasto: String, nuevaFecha: Date, nuevaDescripcion: String, nuevoImporte: Double, nuevoTipoDeGasto: TipoDeGasto) {
        var gastoModificar = GastosModel(nombreGasto: nuevoNombreGasto, fecha: nuevaFecha, descripcion: nuevaDescripcion, importe: nuevoImporte, tipoDeGasto: nuevoTipoDeGasto)
        do {
            try database.collection("gastos").document(id).setData(from: gastoModificar)
        } catch {
            print("No se pudo editar el gasto. \(error)")
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
    
    func getAllExpenses() {
        database.collection("gastos")
            .addSnapshotListener{ query, error in
                if let error = error {
                    print("Ocurrio un error al acceder. \(error)")
                    return
                }
                print("Lectura realizada correctamente")
                self.misGastos = query?.documents.map{ try! $0.data(as: GastosModel.self)} as! [GastosModel]
            }
    }
}
