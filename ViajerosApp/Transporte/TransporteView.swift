//
//  TransporteView.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 12/03/2022.
//

import SwiftUI

struct TransporteView: View {
    
    @StateObject var transporteVM=TransporteViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Header()
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

struct TransporteView_Previews: PreviewProvider {
    static var previews: some View {
        TransporteView()
    }
}

struct Header: View {
    var body: some View {
        HStack{
            Text("Mis Transportes")
                .bold()
                .padding()
                .font(.title)
            Spacer()
            NavigationLink(destination: RegistrarTransporteView(),
            label: {
                Image("addTicket").padding()
            })
            
        }
        .padding(.top)
    }
}
