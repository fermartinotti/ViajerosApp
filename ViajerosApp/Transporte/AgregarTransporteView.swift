//
//  RegistrarTransporteView.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 15/03/2022.
//

import SwiftUI

struct AgregarTransporteView: View {
    
    @EnvironmentObject var transporteVM:TransporteViewModel
    @Environment(\.presentationMode) var pantallaActual
    
    @State var tipoDeViaje:TipoDeViaje
    @State var origen:String=""
    @State var destino:String=""
    @State var fechaOrigen:Date = Date.now
    @State var fechaDestino:Date = Date.now
    @State var codigoViaje:String=""
    
    
    var body: some View {
        VStack{
            switch tipoDeViaje {
            case .AVION:
                Image("AvionBackground")
                    .resizable()
                    .scaledToFill()
                    .frame(height:90, alignment: .top)
                    .ignoresSafeArea()
                    .shadow(color: .gray, radius: 10, x: 0, y: -10)
            case .BARCO:
                Image("BarcoBackground")
                    .resizable()
                    .scaledToFill()
                    .frame(height:90, alignment: .top)
                    .ignoresSafeArea()
                    .shadow(color: .gray, radius: 10, x: 0, y: -10)
            case .TREN:
                Image("TrenBackground")
                    .resizable()
                    .scaledToFill()
                    .frame(height:90, alignment: .top)
                    .ignoresSafeArea()
                    .shadow(color: .gray, radius: 10, x: 0, y: -10)
            }
            Form{
                Section(header: Text("Origen")){
                    HStack {
                        Image(systemName: "mappin.circle.fill")
                        TextField("Origen", text: $origen)
                    }
                        DatePicker("Fecha", selection: $fechaOrigen)
                }
                Section(header: Text("Destino")){
                    HStack {
                        Image(systemName: "mappin.circle.fill")
                        TextField("Destino", text: $destino)
                    }
                    DatePicker("Fecha", selection: $fechaDestino)
                }
                Section(header: Text("Codigo de viaje")){
                    HStack{
                        Image(systemName: "barcode.viewfinder")
                        TextField("Codigo", text:$codigoViaje)
                    }
                }
            }
            .navigationBarTitle("")
            //.navigationBarHidden(true)
            Button(
                action: {
                    transporteVM.agregarTransporte(origen: origen, destino: destino, fechaSalida: fechaOrigen, fechaLlegada: fechaDestino, codigoViaje: codigoViaje, tipoDeViaje: tipoDeViaje)
                    pantallaActual.wrappedValue.dismiss()
                },
                label: {
                    Text("Guardar")
                        .font(.title3)
                        .foregroundColor(Color.black)
                        .padding(.vertical, 14)
                        .padding(.horizontal, 130)
                        .background(.green)
                        .cornerRadius(15)
                        .padding(.bottom, 10)
                        .fixedSize(horizontal: true, vertical: true)
                }
            )
            
            Spacer()
        }
        .navigationBarTitle("")
    }
}

struct RegistrarTransporteView_Previews: PreviewProvider {
    static var previews: some View {
        AgregarTransporteView(tipoDeViaje: TipoDeViaje.BARCO)
    }
}
