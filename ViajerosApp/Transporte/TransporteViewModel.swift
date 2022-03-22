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
        let transporteEjemplo = transporteModel(origen: "ARG", destino: "VNZ", fechaSalida: Date.now, fechaLlegada: Date.now, codigoViaje: "f3inf34k", tipoDeViaje: TipoDeViaje.AVION)
        misTransportes.append(transporteEjemplo)
    }
    
    func agregarTransporte(origen:String, destino:String, fechaSalida:Date, fechaLlegada:Date, codigoViaje:String, tipoDeViaje:TipoDeViaje){
       let nuevoTransporte = transporteModel(origen: origen, destino: destino, fechaSalida: fechaSalida, fechaLlegada: fechaLlegada, codigoViaje: codigoViaje, tipoDeViaje: tipoDeViaje)
        
        misTransportes.append(nuevoTransporte)
    }
    
    func borrarTransporte(transporte:transporteModel){
        if let index = misTransportes.firstIndex(of: transporte){
            misTransportes.remove(at: index)
        }
    }
    
}
