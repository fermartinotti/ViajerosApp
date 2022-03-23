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
                if(gastosVM.misGastos.count == 0) {
                    Spacer()
                    ZStack{
                        Image(systemName: "cart.fill.badge.plus")
                            .resizable().frame(width: 200, height: 200)
                    }
                } else {
                    HStack{
                        Text("Mis gastos")
                            .bold()
                            .font(.title)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                    }
                    List {
                        ForEach(gastosVM.misGastos) {unGasto in
                            NavigationLink(
                                destination: DetalleGastoView(nombreGasto: unGasto.nombreGasto, fechaGasto: unGasto.fecha, descripcion: unGasto.descripcion, importe: unGasto.importe, tipoDeGasto: unGasto.tipoDeGasto),
                                label: {
                                    Text(unGasto.nombreGasto)
                                })
                            .swipeActions(edge: .leading) {
                                Button {
                                    gastosVM.eliminarGasto(gasto: unGasto)
                                } label: {
                                    Image(systemName: "trash")
                                }
                                .tint(.red)
                            }
                        }
                    }
                    NavigationLink(
                        destination: NuevoGastoView(),
                        label: {
                            Image("add_expenses")
                    })
                    Spacer()
                }
            }
        }
        .environmentObject(gastosVM)
    }
}


/* struct GastosView_Previews: PreviewProvider {
    static var previews: some View {
        GastosView()
    }
} */
