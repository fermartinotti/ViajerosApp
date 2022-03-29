//
//  DetalleGastoView.swift
//  ViajerosApp
//
//  Created by Agustin MacIa Del Rio on 16/03/2022.
//

import SwiftUI

struct DetalleGastoView: View {
    
    @EnvironmentObject var gastoVM : GastosViewModel
    @Environment(\.presentationMode) var pantallaActual
    
    @State var nombreGasto: String = ""
    @State var fechaGasto: Date = Date.now
    @State var descripcion: String = ""
    @State var importe: Double = 0.0
    @State var tipoDeGasto: TipoDeGasto = TipoDeGasto.ENTRETENIMIENTO
    
    var idAEditar = ""
    var tiposGastos = ["COMPRAS", "ENTRETENIMIENTO", "GASTRONOMIA", "SALUD", "TRANSPORTE"]
    
    
    var body: some View{
        VStack {
            Form{
                Section(header: Text("Datos del gasto")) {
                    TextField("Nombre", text: $nombreGasto)
                    DatePicker("Fecha", selection: $fechaGasto)
                        .keyboardType(.decimalPad)
                    TextField("Fecha operacion", value: $fechaGasto, formatter: DateFormatter())
                    TextField("Descripcion", text: $descripcion)
                    Picker(selection: $tipoDeGasto, label: Text("Tipo de gasto")) {
                        ForEach(0..<tiposGastos.count) {
                            Text(self.tiposGastos[$0])
                        }
                    }
                }
            }
            .navigationBarTitle("Editar gasto")
        }
        
        Button {
            gastoVM.editarGasto(idAEditar, nuevoNombreGasto: nombreGasto, nuevaFecha: fechaGasto, nuevaDescripcion: descripcion, nuevoImporte: importe, nuevoTipoDeGasto: tipoDeGasto)
            pantallaActual.wrappedValue.dismiss()
        } label: {
            Text("Guardar")
                .font(.title3)
                .foregroundColor(Color.black)
                .padding(.vertical, 14)
                .padding(.horizontal, 130)
                .background(.blue)
                .cornerRadius(15)
                .padding(.bottom, 10)
                .fixedSize(horizontal: true, vertical: true)
        }
    }
}

/* struct DetalleGastoView_Previews: PreviewProvider {
    static var previews: some View {
        DetalleGastoView()
    }
} */

