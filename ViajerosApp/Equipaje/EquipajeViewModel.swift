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
        getAllEquipajes()
    }
    
    func getAllEquipajes(){
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
        let nuevoItem = itemModel(descripcion: descripcion, cantidad: cantidad, done: true)
        do{
            _ = try database.collection("equipaje").addDocument(from: nuevoItem)
        }catch {
            print ("Error al crear: \(error)")
        }
    }

    func borrarItem(item:itemModel){
        database.collection("equipaje").document(item.id!).delete()
    }

    func marcarItem(item:itemModel, resultado:Bool){
        var itemModificado=itemModel(descripcion: item.descripcion, cantidad: item.cantidad, done: !item.done)
        do {
            try database.collection("equipaje").document(item.id!).setData(from: itemModificado)
        }catch {
            print ("Error al actualizar: \(error)")
        }
    }
    
}
