//
//  InicioViewModel.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 23/03/2022.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

class InicioViewModel: ObservableObject {
    
    @Published var viaje = InicioModel(fechaDeViaje: Date.now, lugarDeViaje: "")
    private var database = Firestore.firestore()
    private var colection:[InicioModel] = []
    
    init(){
        getDestino()
    }
    
    func agregarDestino(fecha:Date, lugar:String){
        let nuevoViaje = InicioModel(fechaDeViaje: fecha, lugarDeViaje: lugar)
        do{
            _ = try database.collection("destino").addDocument(from: nuevoViaje)
        }catch {
            print ("Error al crear: \(error)")
        }
    }
    
    func borrarDestino(){
        database.collection("destino").document(viaje.id!).delete()
        self.viaje = InicioModel(fechaDeViaje: Date.now, lugarDeViaje: "")
    }
    
    func getDestino(){
        database.collection("destino")
            .addSnapshotListener{ query, error in
                if let error = error{
                    print("hubo un error al acceder. \(error)")
                    return
                }
                self.colection=query?.documents.map{ try! $0.data(as: InicioModel.self)} as! [InicioModel]
                if let miViajeGuardado = self.colection.first{
                    self.viaje = miViajeGuardado
                }
                
        }
    }
}
