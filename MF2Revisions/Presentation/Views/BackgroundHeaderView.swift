//
//  BackgroundHeaderView.swift
//  MF2Revisions
//
//  Created by Nicolas Guyot on 18/07/2024.
//

import SwiftUI

struct BackgroundHeaderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color("AppBlue"))
            Circle()
                .fill(Color("AppBlueLight"))
                .frame(width: 100, height: 100)
                .position(CGPoint(x: 10.0, y: 75.0))
            Circle()
                .fill(Color("AppBlue"))
                .frame(width: 90, height: 80)
                .position(CGPoint(x: 10.0, y: 75.0))

            Circle()
                .fill(Color("AppBlueLight"))
                .frame(width: 200, height: 200)
                .position(CGPoint(x: 350.0, y: 40.0))
            
            Circle()
                .fill(Color("AppBlue"))
                .frame(width: 180, height: 180)
                .position(CGPoint(x: 350.0, y: 40.0))
            
            Circle()
                .fill(Color("AppBlueLight"))
                .frame(width: 100, height: 100)
                .position(CGPoint(x: 150.0, y: 150.0))
            Circle()
                .fill(Color("AppBlue"))
                .frame(width: 80, height: 80)
                .position(CGPoint(x: 150.0, y: 150.0))
        }
        .frame(height: 250)
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundHeaderView()
}
