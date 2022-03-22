//
//  DetalleTransporteView.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 16/03/2022.
//

import SwiftUI

struct DetalleTransporteView: View {
    
    @State var origen:String=""
    @State var destino:String=""
    @State var fechaOrigen:Date = Date.now
    @State var fechaDestino:Date = Date.now
    @State var codigoViaje:String=""
    
    var body: some View {
        VStack{
            VStack(spacing:-35){
                    Rectangle()
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .leading, endPoint: .trailing)
                            )
                        .frame(height: 200)
                        .overlay(
                            VStack{
                            Text("Tu ticket")
                                .font(.title)
                                .bold()
                                .foregroundColor(.white)
                        })
                ScrollView {
                    Image("ticket1")
                        .resizable()
                        .frame(width: 300, height:400)
                        .ignoresSafeArea()
                        .shadow(color: .gray, radius: 5, y: 5)
                        .overlay(
                            VStack{
                                VStack(alignment: .leading) {
                                    Text("Origen")
                                        .foregroundColor(.gray)
                                        .padding(.top)
                                    Text(origen)
                                        .bold()
                                    Text("Fecha")
                                        .foregroundColor(.gray)
                                        .padding(.top)
                                    Text(fechaOrigen.formatted())
                                        .bold()
                                }
                                Divider()
                                VStack(alignment: .leading) {
                                    Text("Destino")
                                        .foregroundColor(.gray)
                                        .padding(.top)
                                    Text(destino)
                                        .bold()
                                    Text("Fecha")
                                        .foregroundColor(.gray)
                                        .padding(.top)
                                    Text(fechaOrigen.formatted())
                                }
                                
                        })
                    Image("ticket2")
                        .resizable()
                        .frame(width: 300, height: 140)
                        .ignoresSafeArea()
                        .shadow(color: .gray, radius: 10, x: 0, y: -10)
                        .overlay(
                            VStack(alignment: .center, spacing: 10){
                                Text(codigoViaje)
                            }.padding(.top, 60)
                        
                        )
                        .padding(.top)
                    
                }
            }
            .ignoresSafeArea()
            Spacer()
        }
        .navigationTitle("")
    }
}

struct DetalleTransporteView_Previews: PreviewProvider {
    static var previews: some View {
        DetalleTransporteView()
    }
}
