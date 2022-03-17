//
//  DetalleTransporteView.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 16/03/2022.
//

import SwiftUI

struct DetalleTransporteView: View {
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
                Image("ticket1")
                    .resizable()
                    .frame(width: 300, height:400)
                    .ignoresSafeArea()
                    .shadow(color: .gray, radius: 10, x: 0, y: -10)
                    .overlay(
                        VStack{
                        Text("Hola test")
                    })
                Image("ticket2")
                    .resizable()
                    .frame(width: 300, height: 140)
                    .ignoresSafeArea()
                    .shadow(color: .gray, radius: 10, x: 0, y: -10)
                    .overlay(
                        VStack{
                        Text("")
                        }).padding(.top,40)
//                Rectangle()
//                    .fill(.white)
//                    .frame(width: 100, height: 60)
//                    .overlay(
//                        Rectangle().stroke(lineWidth: 2).foregroundColor(.black)
//                    )
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
