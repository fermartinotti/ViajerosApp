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
    
    @State var id: String = ""
    @State var nombreGasto: String = ""
    @State var fechaGasto: Date = Date.now
    @State var descripcion: String = ""
    @State var importe: Double = 0.0
    @State var gastoSeleccionado:TipoDeGasto = TipoDeGasto.ENTRETENIMIENTO
    
    var tiposGastos = TipoDeGasto.allCases
    var idAEditar = ""
    
    
    var body: some View{
        VStack {
            Form{
                Section(header: Text("Datos del gasto")) {
                    TextField("Nombre", text: $nombreGasto)
                    DatePicker("Fecha", selection: $fechaGasto)
                    TextField("Descripcion", text: $descripcion)
                    TextField("Importe", value: $importe, formatter: NumberFormatter())
                    Picker(selection: $gastoSeleccionado, label: Text("Tipo de gasto")) {
                        ForEach(tiposGastos, id: \.self) { unTipoDeGasto in
                            Text(unTipoDeGasto.rawValue).font(.footnote)
                        }
                    }
                }
            }
            .navigationBarTitle("Editar gasto")
        }
        
        Button {
            gastoVM.editarGasto(idAEditar, nuevoNombreGasto: nombreGasto, nuevaFecha: fechaGasto, nuevaDescripcion: descripcion, nuevoImporte: importe, nuevoTipoDeGasto: gastoSeleccionado)
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

