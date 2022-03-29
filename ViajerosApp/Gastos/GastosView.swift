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
    @State var irANuevoGasto = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(isActive: $irANuevoGasto,
                               destination: {NuevoGastoView()},
                               label: {
                })
                if(gastosVM.misGastos.count == 0) {
                    Spacer()
                    ZStack{
                        Image("emptyGasto")
                            .resizable().frame(width: 200, height: 200)
                    }
                    Spacer()
                } else {
                    List {
                        ForEach(gastosVM.misGastos) {unGasto in
                            NavigationLink(
                                destination: DetalleGastoView(id: unGasto.id, nombreGasto: unGasto.nombreGasto, fechaGasto: unGasto.fecha, descripcion: unGasto.descripcion, importe: unGasto.importe, gastoSeleccionado: unGasto.tipoDeGasto),
                                label: {
                                    HStack {
                                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                                            .fill(Color.indigo.opacity(0.1))
                                            .frame(width: 44, height: 44)
                                            .overlay {
                                                //FontIcon.text(.awesome5Solid(code: .icons), fontsize: 24, color: .blue)
                                                switch unGasto.tipoDeGasto {
                                                    case .COMPRAS:
                                                    FontIcon.text(.awesome5Solid(code: .shopping_cart), fontsize: 24, color: Color("CelesteCustom"))
                                                case .ENTRETENIMIENTO:
                                                    FontIcon.text(.awesome5Solid(code: .film), fontsize: 24, color: Color("CelesteCustom"))
                                                case .GASTRONOMIA:
                                                    FontIcon.text(.awesome5Solid(code: .hamburger), fontsize: 24, color: Color("CelesteCustom"))
                                                case .SALUD:
                                                    FontIcon.text(.awesome5Solid(code: .heart), fontsize: 24, color: Color("CelesteCustom"))
                                                case .TRANSPORTE:
                                                    FontIcon.text(.awesome5Solid(code: .bus), fontsize: 24, color: Color("CelesteCustom"))
                                                }
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
                                            .lineLimit(1)
                                    }
                                    
                                })
                            //.padding([.top, .bottom], 5)
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
                }
            }
            .navigationBarTitle("Mis gastos", displayMode: .inline)
            .toolbar(content: {
                Button(action: {
                    self.irANuevoGasto = true
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color("CelesteCustom"))
                })
            })
        }
        .environmentObject(gastosVM)
    }
}


// struct GastosView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            GastosView()
//            GastosView()
//                .preferredColorScheme(.dark)
//        }
//    }
//}
