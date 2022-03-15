//
//  TransporteViewModel.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 15/03/2022.
//

import Foundation

class TransporteViewModel: ObservableObject{
    
    @Published var misTransportes:[transporteModel]=[]
    
    init(){
        // Precargar algunos transportes.
    }
    
}
