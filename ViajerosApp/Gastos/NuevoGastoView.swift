//
//  NuevoGastoView.swift
//  ViajerosApp
//
//  Created by Agustin MacIa Del Rio on 16/03/2022.
//

import SwiftUI

struct NuevoGastoView: View {
    
    @EnvironmentObject var gastoVM : GastosViewModel
    
    
    //@State var tipoDeGasto : TipoDeGasto
    
    
    var body: some View {
        VStack {
            Text("Añadir nuevo gasto")
        }
    }
}

struct NuevoGastoView_Previews: PreviewProvider {
    static var previews: some View {
        NuevoGastoView()
    }
}
