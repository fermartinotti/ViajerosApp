//
//  TransporteViewModel.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 15/03/2022.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

class TransporteViewModel: ObservableObject{
    
    @Published var misTransportes:[transporteModel]=[]
    private var database = Firestore.firestore()
    
    init(){
        getAllTransportes()
    }
    
    func getAllTransportes(){
        database.collection("transporte")
            .addSnapshotListener{ query, error in
                if let error = error{
                    print("hubo un error al acceder. \(error)")
                    return
                }
                print ("funciona")
                self.misTransportes=query?.documents.map{ try! $0.data(as: transporteModel.self)} as! [transporteModel]
        }
    }
    
    func agregarTransporte(origen:String, destino:String, fechaSalida:Date, fechaLlegada:Date, codigoViaje:String, tipoDeViaje:TipoDeViaje){
       let nuevoTransporte = transporteModel(origen: origen, destino: destino, fechaSalida: fechaSalida, fechaLlegada: fechaLlegada, codigoViaje: codigoViaje, tipoDeViaje: tipoDeViaje)
        
        do{
            _ = try database.collection("transporte").addDocument(from: nuevoTransporte)
        }catch{
            print("Error al crear: \(error)")
        }
    }
    
    func borrarTransporte(transporte:transporteModel){
        database.collection("transporte").document(transporte.id!).delete()
    }
    
}
