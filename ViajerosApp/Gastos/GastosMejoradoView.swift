//
//  GastosMejoradoView.swift
//  ViajerosApp
//
//  Created by Agustin MacIa Del Rio on 25/03/2022.
//

import SwiftUI
import SwiftUIFontIcon

struct GastosMejoradoView: View {
    
    @StateObject var gastosVM = GastosViewModel()
    @State var agregarGasto = false
    
    var body: some View {
        HStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay {
                    FontIcon.text(.awesome5Solid(code: .icons), fontsize: 24, color: .blue)
                }
            
            VStack(alignment: .leading, spacing: 6) {
                // Nombre gasto
                Text("Subte")
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                // Tipo de gasto
                Text("Categoria")
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                //Fecha
                Text(Date(), format: .dateTime.day().month().year())
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
            //Importe
            Text(57.49, format: .currency(code: "USD"))
                .bold()
        }
        .padding([.top, .bottom], 8)
    }
}

struct GastosMejoradoView_Previews: PreviewProvider {
    static var previews: some View {
        GastosMejoradoView()
    }
}
