//
//  InicioView.swift
//  ViajerosApp
//
//  Created by Hector Fernando Martinotti on 14/03/2022.
//

import SwiftUI

struct InicioView: View {
    
    @StateObject var inicioVM=InicioViewModel()
    @State private var nowDate: Date = Date()
    @State private var destino:String = ""
    @State private var fecha:Date = Date()
    @State private var mostrarAlerta = false
    
        var timer: Timer {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
                self.nowDate = Date()
            }
        }

    
    var body: some View {
        ZStack{
            Image("HomeBackground")
                .resizable()
            .edgesIgnoringSafeArea(.top)
            .scaledToFill()
            .blur(radius: 1, opaque: false)
            VStack{
                if inicioVM.viaje.lugarDeViaje == ""{
                    Spacer()
                    VStack(alignment: .center) {
                        Text("¿A donde vas a viajar?")
                        TextField("Destino...", text: $destino)
                            .multilineTextAlignment(.center)
                        Text("¿Cuando inicia tu viaje?")
                        HStack {
                            DatePicker("Fecha", selection: $fecha).fixedSize()
                        }
                        Button(action:{
                            inicioVM.agregarDestino(fecha: fecha, lugar: destino)
                        },label: {
                            Text("Comenzar Viaje")
                                .font(.title3)
                                .bold()
                                .foregroundColor(Color.black)
                                .padding(.vertical, 14)
                                .padding(.horizontal, 110)
                                .background(.white)
                                .cornerRadius(15)
                                .padding(.bottom, 10)
                                .fixedSize(horizontal: true, vertical: true)
                        }).disabled(destino == "")
                    }
                    Spacer()
                }else{
                    Spacer()
                    if (inicioVM.viaje.fechaDeViaje > nowDate){
                        Text("Faltan").bold().font(.title)
                        Text(countDownString(from: nowDate, to: inicioVM.viaje.fechaDeViaje))
                            .font(.title).bold()
                                    .onAppear(perform: {
                                        _ = self.timer
                                    })
                        Text("Para iniciar tu viaje a").bold().font(.title)
                        Text(inicioVM.viaje.lugarDeViaje)
                            .bold().font(.title).background(.black.opacity(0.3)).foregroundColor(.white)
                    }else{
                        VStack {
                            Text("Comenzo tu viaje a").bold().font(.title)
                            Text(inicioVM.viaje.lugarDeViaje)
                                .bold().font(.title).background(.black.opacity(0.3)).foregroundColor(.white)
                            Text("¡A disfrutar!").bold().font(.title)
                        }

                    }
                    
                    Spacer()
                    Button(
                        action:{
                            mostrarAlerta = true
                        },label:{
                            Text("Elegir nuevo destino")
                                .font(.title3)
                                .bold()
                                .foregroundColor(Color.black)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 60)
                                .background(.white)
                                .cornerRadius(15)
                                .padding(.bottom, 10)
                                .fixedSize(horizontal: true, vertical: true)
                        }
                    ).padding(.bottom, 80)
                        .alert(isPresented:$mostrarAlerta){
                            Alert(title: Text("¿Estas seguro de iniciar un nuevo viaje?"), message: Text("Solo eliminara lugar y fecha. Tus transportes, equipaje y gastos se guardaran"), primaryButton: .destructive(Text("Confirmar")){
                                // BORRAR VIAJE
                                inicioVM.borrarDestino()
                                self.destino = ""
                            }, secondaryButton: .cancel(Text("Cancelar"))
                            )
                        }
                }
            }
        }
    }
    
    func countDownString(from fromDate: Date, to toDate: Date) -> String {
            let calendar = Calendar(identifier: .gregorian)
            let components = calendar
                .dateComponents([.day, .hour, .minute, .second],
                                from: fromDate,
                                to: toDate)
            return String(format: "%02dd:%02dh:%02dm:%02ds",
                          components.day ?? 00,
                          components.hour ?? 00,
                          components.minute ?? 00,
                          components.second ?? 00)
        }
}

//struct InicioView_Previews: PreviewProvider {
//    static var previews: some View {
//        InicioView()
//    }
//}
