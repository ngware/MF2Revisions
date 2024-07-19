//
//  GrowingButton.swift
//  MF2Revisions
//
//  Created by Nicolas Guyot on 19/07/2024.
//

import SwiftUI

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color("AppBlue"))
            .foregroundStyle(.white)
//            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            
            .cornerRadius(10)
            .shadow(color: .white, radius: 4)
            
    }
}
