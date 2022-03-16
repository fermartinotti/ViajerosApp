//
//  TransporteView.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 12/03/2022.
//

import SwiftUI

struct TransporteView: View {
    
    @StateObject var transporteVM=TransporteViewModel()
    @State var irACrearBarco = false
    @State var irACrearAvion = false
    @State var irACrearTren = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                //INICIA header
                HStack{
                    Text("Mis Transportes")
                        .bold()
                        .padding()
                        .font(.title)
                    Spacer()
                    Menu{
                        Button("Avion", action: { irACrearAvion = true})
                        Button("Barco", action: { irACrearBarco = true})
                        Button("Tren", action: { irACrearTren = true})
                    }
                    label:{
                        Image("addTicket").padding()
                    }
                    
                    NavigationLink(isActive: $irACrearBarco,
                                   destination: {AgregarTransporteView(tipoDeViaje: TipoDeViaje.BARCO)},
                                   label: {
                    })
                    NavigationLink(isActive: $irACrearAvion,
                                   destination: {AgregarTransporteView(tipoDeViaje: TipoDeViaje.AVION)},
                                   label: {
                    })
                    NavigationLink(isActive: $irACrearTren,
                                   destination: {AgregarTransporteView(tipoDeViaje: TipoDeViaje.TREN)},
                                   label: {
                    })
                }
                .padding(.top)
                // FINALIZA HEADER
                
                //Si no tengo transportes cargados todavia:
                if(transporteVM.misTransportes.count==0){
                    Spacer()
                    ZStack {
                        Image("empty")
                            .resizable().frame(width: 200, height: 200)
                    }
                }else{
                    List{
                        ForEach(transporteVM.misTransportes) {unTransporte in
                            
                            VStack {
                                switch unTransporte.tipoDeViaje{
                                    case .AVION:
                                    Card(imagenBackground: "AvionBackground", origen: unTransporte.origen, destino: unTransporte.destino, codigo: unTransporte.codigoViaje)
                                    case .BARCO:
                                    Card(imagenBackground: "BarcoBackground", origen: unTransporte.origen, destino: unTransporte.destino, codigo: unTransporte.codigoViaje)
                                    case .TREN:
                                    Card(imagenBackground: "TrenBackground", origen: unTransporte.origen, destino: unTransporte.destino, codigo: unTransporte.codigoViaje)
                                }
                                
                            }
                        }
                    }
                }
                Spacer()
                
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        .environmentObject(transporteVM)
    }
    
}

struct Card: View {
    
    @State var imagenBackground:String
    @State var origen:String
    @State var destino:String
    @State var codigo:String
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Image(imagenBackground)
                .resizable()
                .frame(width: 300, height: 140)
                .scaledToFill()
                .colorMultiply(.gray)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke()
                        .shadow(color: .gray, radius: 6, x:-1, y:-1)
                        .shadow(color: .gray, radius: 6, x:1, y:1)
                )
            VStack(alignment: .leading) {
                HStack{
                    Text(origen)
                        .font(.title3)
                    Image(systemName: "arrow.right")
                    Text(destino)
                }
                .foregroundColor(.white)
                HStack{
                    Image(systemName: "barcode.viewfinder")
                        .font(.title3)
                    Text(codigo)
                }
                .foregroundColor(.white)
            }.padding()
        }
        .padding()
    }
}

struct TransporteView_Previews: PreviewProvider {
    static var previews: some View {
        TransporteView()
    }
}
