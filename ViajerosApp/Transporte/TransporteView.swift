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
                                   destination: {AgregarTransporte(tipoDeViaje: TipoDeViaje.BARCO)},
                                   label: {
                    })
                    NavigationLink(isActive: $irACrearAvion,
                                   destination: {AgregarTransporte(tipoDeViaje: TipoDeViaje.AVION)},
                                   label: {
                    })
                    NavigationLink(isActive: $irACrearTren,
                                   destination: {AgregarTransporte(tipoDeViaje: TipoDeViaje.TREN)},
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
                        Text("No hay transportes registrados")
                            .bold()
                            .font(.title3)
                            .foregroundColor(.red)
                    }
                }else{

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
    @State var icono:String
    @State var titulo:String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.white)
                .frame(width: 80, height: 80)
                .shadow(color: .gray, radius: 6, x:-1, y:-1)
                .shadow(color: .gray, radius: 6, x:1, y:1)
            VStack {
                Image(icono)
                    .resizable().frame(width: 35, height: 35)
                Text(titulo)
                    .bold()
            }
        }
        .padding()
    }
}

struct TransporteView_Previews: PreviewProvider {
    static var previews: some View {
        TransporteView()
    }
}
