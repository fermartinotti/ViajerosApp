//
//  EquipajeView.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 14/03/2022.
//

import SwiftUI

struct EquipajeView: View {
    
    @StateObject var equipajeVM=EquipajeViewModel()
    @State var descripcionNueva:String = ""
    @State var cantidadNueva:Int=1
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    TextField("Agregar...", text: $descripcionNueva)
                        .padding(.leading)
                    HStack {
                        Text("Cantidad: \(cantidadNueva)")
                        Stepper(value: $cantidadNueva,
                                        in: 1...100,
                                        label: { })
                        .tint(Color("CelesteCustom"))
                    }.padding()
                    
                        Button(action: {
                            equipajeVM.agregarItem(descripcion: descripcionNueva, cantidad: cantidadNueva)
                            self.cantidadNueva = 1
                            self.descripcionNueva = ""
                        }) {
                            Text("Agregar")
                                .font(.title3)
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 140)
                                .background(Color("CelesteCustom"))
                                .cornerRadius(10)
                                .padding(.bottom, 10)
                                .fixedSize(horizontal: true, vertical: true)
                        }.disabled(self.descripcionNueva.count == 0)
                }
                List{
                    Section(header: Text("Mi equipaje")) {
                        ForEach(equipajeVM.misItems) {unItem in
                            HStack {
                                Button {
                                    equipajeVM.marcarItem(item: unItem, resultado: !unItem.done)
                                }label:{
                                    if (unItem.done){
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.green)
                                    }else{
                                        Image(systemName: "circle")
                                    }
                                }
                                Text("\(unItem.descripcion) X\(unItem.cantidad)")
                                    .strikethrough(unItem.done, color: .black)
                            }
                            .swipeActions(edge: .leading){
                                Button {
                                    equipajeVM.borrarItem(item: unItem)
                                }label:{
                                    Image(systemName: "trash.fill")
                                }
                            }.swipeActions(edge: .trailing){
                                Button {
                                    equipajeVM.marcarItem(item: unItem, resultado: !unItem.done)
                                }label:{
                                    Image(systemName: "bookmark.slash.fill")
                                }
                            }
                        }
                    }
                }.listStyle(PlainListStyle())
                //fin list
            }
            .navigationBarTitle("Mi Equipaje", displayMode: .inline)
        }
        .environmentObject(equipajeVM)
    }
    
}



struct EquipajeView_Previews: PreviewProvider {
    static var previews: some View {
        EquipajeView()
    }
}
