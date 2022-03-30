//
//  NuevoGastoView.swift
//  ViajerosApp
//
//  Created by Agustin MacIa Del Rio on 16/03/2022.
//

import SwiftUI

struct NuevoGastoView: View {
    
    @State var nombre = ""
    @State var fecha = Date.now
    @State var descripcion = ""
    @State var importe : Double = 0
    
    @State var gastoSeleccionado:TipoDeGasto = TipoDeGasto.ENTRETENIMIENTO
    var tiposGastos = TipoDeGasto.allCases
    
    @EnvironmentObject var gastosVM : GastosViewModel
    @Environment(\.presentationMode) var pantallaActual
    
    var body: some View {
        VStack {
            Form {
                TextField("Nombre", text: $nombre)
                DatePicker("Fecha", selection: $fecha, displayedComponents: .date)
                TextField("Descripcion", text: $descripcion)
                TextField("Importe", value: $importe, formatter: NumberFormatter())
                    .keyboardType(.decimalPad)
                Picker(selection: $gastoSeleccionado, label: Text("Tipo de gasto")) {
                    ForEach(tiposGastos, id: \.self) { unTipoDeGasto in
                        Text(unTipoDeGasto.rawValue).font(.footnote)
                    }
                }
                .navigationBarTitle("Nuevo gasto")
                .padding()
            }
            Button {
                gastosVM.createExpense(nombreGasto: nombre, fecha: fecha, descripcion: descripcion, importe: importe, tipoDeGasto: gastoSeleccionado)
                pantallaActual.wrappedValue.dismiss()
            } label: {
                Text("Guardar")
                    .font(.title3)
                    .foregroundColor(Color.black)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 130)
                    .background(Color("CelesteCustom"))
                    .cornerRadius(15)
                    .padding(.bottom, 10)
                    .fixedSize(horizontal: true, vertical: true)
            }.disabled(self.importe == 0.0 && self.nombre == "")
        }
    }
}

/* struct NuevoGastoView_Previews: PreviewProvider {
    static var previews: some View {
        NuevoGastoView()
    }
} */
