//
//  ContentView.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 11/03/2022.
//
import SwiftUI

struct HomeView: View {
    
    var body: some View {
        HomeTabView()
    }
}

struct HomeTabView: View {
    
    var body: some View {
        TabView{
            InicioView()
                .tabItem{
                    VStack {
                        Image(systemName: "house.circle")
                        Text("Inicio")
                    }
                }
            TransporteView()
                .tabItem{
                    VStack {
                        Image(systemName: "airplane")
                        Text("Transporte")
                    }
                }
            EquipajeView()
                .tabItem{
                    VStack {
                        Image(systemName: "bag")
                        Text("Equipaje")
                    }
                }
            GastosView()
                .tabItem{
                    VStack {
                        Image(systemName: "dollarsign.circle")
                        Text("Gastos")
                    }
                }
        }
        //.navigationBarBackButtonHidden(true)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
