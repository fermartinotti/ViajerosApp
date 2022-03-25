//
//  GastosView.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 13/03/2022.
//

import SwiftUI
import SwiftUIFontIcon

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
                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                        .fill(Color.icon.opacity(0.3))
                                        .frame(width: 44, height: 44)
                                        .overlay {
                                            FontIcon.text(.awesome5Solid(code: .icons), fontsize: 24, color: .blue)
                                        }
                                    VStack(alignment: .leading, spacing: 6) {
                                        // Nombre gasto
                                        Text(unGasto.nombreGasto)
                                            .font(.subheadline)
                                            .bold()
                                            .lineLimit(1)
                                        
                                        // Tipo de gasto
                                        Text(unGasto.tipoDeGasto.rawValue)
                                            .font(.footnote)
                                            .opacity(0.7)
                                            .lineLimit(1)
                                        
                                        //Fecha
                                        Text(unGasto.fecha, format: .dateTime.day().month().year())
                                            .font(.footnote)
                                            .foregroundColor(.secondary)
                                    }
                                    Spacer()
                                    //Importe
                                    Text(unGasto.importe, format: .currency(code: "USD"))
                                        .bold()
                                })
                            .padding([.top, .bottom], 8)
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


 struct GastosView_Previews: PreviewProvider {
    static var previews: some View {
        GastosView()
    }
} 
