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
        //cargar lista de items.
    }
}
