//
//  Extensions.swift
//  ViajerosApp
//
//  Created by Agustin MacIa Del Rio on 25/03/2022.
//

import Foundation
import SwiftUI

extension Color {
    static let background = Color("background")
    static let icon = Color("Icon")
    static let text = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
}
                                        
extension DateFormatter {
    static let fecha: DateFormatter = {
        print("Inicializar DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        return formatter
    }()
}
