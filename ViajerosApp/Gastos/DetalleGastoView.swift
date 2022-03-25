//
//  DetalleGastoView.swift
//  ViajerosApp
//
//  Created by Agustin MacIa Del Rio on 16/03/2022.
//

import SwiftUI

struct DetalleGastoView: View {
    
    @EnvironmentObject var gastoVM : GastosViewModel
    
    @State var nombreGasto: String = ""
    @State var fechaGasto: Date = Date.now
    @State var descripcion: String = ""
    @State var importe: Double = 0.0
    @State var tipoDeGasto: TipoDeGasto = TipoDeGasto.ENTRETENIMIENTO
    
    
    var body: some View{
        VStack {
            Form{
                Section(header: Text("Datos del gasto")) {
                    TextField("Nombre", text: $nombreGasto)
                    TextField("$ Importe", value: $importe, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                    TextField("Fecha operacion", value: $fechaGasto, formatter: DateFormatter())
                    TextField("Descripcion", text: $descripcion)
                }
            }
            .frame(height: 200)
        }
    }
}

/* struct DetalleGastoView_Previews: PreviewProvider {
    static var previews: some View {
        DetalleGastoView()
    }
} */

