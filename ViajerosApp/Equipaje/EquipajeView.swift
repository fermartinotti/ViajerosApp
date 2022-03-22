//
//  EquipajeView.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 14/03/2022.
//

import SwiftUI

struct EquipajeView: View {
    
    @StateObject var equipajeVM=EquipajeViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack {
                //Si no tengo transportes cargados todavia:
                if(equipajeVM.misItems.count==0){
                    Spacer()
                    ZStack {
                        Image("addList")
                            .resizable().frame(width: 200, height: 200)
                    }
                }else{
                    List{
                        ForEach(equipajeVM.misItems) {unItem in
                            Text(unItem.descripcion)
                        }
                    }.listStyle(PlainListStyle())
                        
                }
                Spacer()
                
            }
            .navigationBarTitle("Mi Equipaje")
            .toolbar(content: {
                Image(systemName: "note.text.badge.plus").resizable().frame(width: 40, height: 40)
                    .foregroundColor(Color("CelesteCustom"))
            })
            
        }
        .environmentObject(equipajeVM)
    }
    
}



struct EquipajeView_Previews: PreviewProvider {
    static var previews: some View {
        EquipajeView()
    }
}
