//
//  primerViajeView.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 11/03/2022.
//

import SwiftUI

struct PrimerViajeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 2)
                VStack{
                    Spacer()
                    Text("Vas a empezar una")
                        .foregroundColor(.white)
                        .font(.title3)
                    Text("Nueva Aventura")
                        .foregroundColor(.white)
                        .bold()
                        .font(.largeTitle)
                        .padding(0.1)
                    Text("Organiza tu itinerario, anota lo que te vas a llevar, carga tus vuelos y empeza a disfrutar")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 50)
                    Spacer()
                    NavigationLink(
                        destination: HomeTabView(),
                        label: {
                            Text("Comenzar")
                                .font(.title3)
                                .bold()
                                .foregroundColor(Color.black)
                                .padding(.vertical, 14)
                                .padding(.horizontal, 110)
                                .background(.white)
                                .cornerRadius(15)
                                .padding(.bottom, 10)
                                .fixedSize(horizontal: true, vertical: true)
                            
                        }
                    )
                }
            }
        }
    }
}

struct primerViajeView_Previews: PreviewProvider {
    static var previews: some View {
        PrimerViajeView()
    }
}
