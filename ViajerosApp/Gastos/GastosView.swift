//
//  GastosView.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 13/03/2022.
//

import SwiftUI

struct GastosView: View {
    
    @StateObject var gastosVM = GastosViewModel()
    @State var agregarGasto = false
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    Text("Mis gastos")
                    
                        .bold()
                        .font(.title)
                }
                List {
                    ForEach(gastosVM.misGastos) {unGasto in
                        NavigationLink(
                            destination: NuevoGastoView(tipoDeGasto: tipoDeGasto.COMPRAS),
                            label: {
                                Text(unGasto.nombreGasto)
                            })
                    }
                }
                NavigationLink(
                    destination: NuevoGastoView(tipoDeGasto: tipoDeGasto.COMPRAS),
                    label: {
                        Text("+")
                            .font(.title)
                })
            }
        }
    }
}


struct GastosView_Previews: PreviewProvider {
    static var previews: some View {
        GastosView()
    }
}
