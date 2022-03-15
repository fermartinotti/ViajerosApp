//
//  RegistrarTransporteView.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 15/03/2022.
//

import SwiftUI

struct RegistrarTransporteView: View {
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(.white)
                    .frame(width: 150, height: 150)
                    .shadow(color: .white, radius: 10)
                Text("hola")
            }
            Divider()
            Spacer()
        }.background(.gray)
    }
}

struct RegistrarTransporteView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrarTransporteView()
    }
}
