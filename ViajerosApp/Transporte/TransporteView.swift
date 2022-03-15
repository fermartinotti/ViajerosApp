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
        VStack {
            Header()
            Spacer()
        }
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
            Image("addTicket")
                .padding()
        }
        .padding(.top)
    }
}
