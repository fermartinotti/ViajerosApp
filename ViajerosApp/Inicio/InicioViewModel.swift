//
//  InicioViewModel.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 23/03/2022.
//

import Foundation

class InicioViewModel: ObservableObject {
    
    @Published var inicioModel = InicioModel(fechaDeViaje: Date.now, lugarDeViaje: "")
    
    func agregarDestino(fecha:Date, lugar:String){
        inicioModel.lugarDeViaje=lugar
        inicioModel.fechaDeViaje=fecha
    }
}
