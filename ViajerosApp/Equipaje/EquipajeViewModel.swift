//
//  EquipajeViewModel.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 22/03/2022.
//

import Foundation

class EquipajeViewModel : ObservableObject {
    
    @Published var misItems:[itemModel] = []
    
    init (){
        //var itemUno=itemModel(descripcion: "Remeras", cantidad: 5)
        //misItems.append(itemUno)
        //cargar lista de items.
    }
    
    func agregarItem(descripcion:String, cantidad:Int){
        let nuevoItem = itemModel(descripcion: descripcion, cantidad: cantidad)
        misItems.append(nuevoItem)
    }
    
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
