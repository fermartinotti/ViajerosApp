//
//  EquipajeViewModel.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 22/03/2022.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

class EquipajeViewModel : ObservableObject {
    
    @Published var misItems:[itemModel] = []
    
    private var database = Firestore.firestore()
    
    init (){
        getAllCanciones()
    }
    
    func getAllCanciones(){
        database.collection("equipaje")
            .addSnapshotListener{ query, error in
                if let error = error{
                    print("hubo un error al acceder. \(error)")
                    return
                }
                print ("funciona")
                self.misItems=query?.documents.map{ try! $0.data(as: itemModel.self)} as! [itemModel]
        }
    }
    
    func agregarItem(descripcion:String, cantidad:Int){
        let nuevoItem = itemModel(descripcion: descripcion, cantidad: cantidad)
        do{
            _ = try database.collection("equipaje").addDocument(from: nuevoItem)
        }catch {
            print ("Error al crear: \(error)")
        }
    }
    
//    func agregarItem(descripcion:String, cantidad:Int){
//        let nuevoItem = itemModel(descripcion: descripcion, cantidad: cantidad)
//        misItems.append(nuevoItem)
//    }

    func borrarItem(item:itemModel){
        if let index = misItems.firstIndex(of: item){
            misItems.remove(at: index)
        }
    }

    func marcarItem(item:itemModel, resultado:Bool){
        let posicionAActualizar=misItems.firstIndex(of: item)
            if let posicion=posicionAActualizar{
                misItems[posicion].done=resultado
            }
    }
    
}
