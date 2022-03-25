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
    @State var tipoDeGasto : TipoDeGasto = TipoDeGasto.ENTRETENIMIENTO
    @State var tipoGastoIndex = 0
    
    var tiposGastos = ["COMPRAS", "ENTRETENIMIENTO", "GASTRONOMIA", "SALUD", "TRANSPORTE"]
    
    
    @EnvironmentObject var gastosVM : GastosViewModel
    @Environment(\.presentationMode) var pantallaActual
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Datos del gasto")) {
                    TextField("Nombre", text: $nombre)
                    DatePicker("Fecha", selection: $fecha)
                    TextField("Descripcion", text: $descripcion)
                    TextField("Importe", value: $importe, formatter: NumberFormatter())
                    Picker(selection: $tipoGastoIndex, label: Text("Tipo de gasto")) {
                        ForEach(0..<tiposGastos.count) {
                            Text(self.tiposGastos[$0])
                        }
                    }
                }.padding()
            }
            Button {
                gastosVM.agregarGasto(nombreGasto: nombre, fecha: fecha, descripcion: descripcion, importe: importe, tipoDeGasto: tipoDeGasto)
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
}

/* struct NuevoGastoView_Previews: PreviewProvider {
    static var previews: some View {
        NuevoGastoView()
    }
} */
