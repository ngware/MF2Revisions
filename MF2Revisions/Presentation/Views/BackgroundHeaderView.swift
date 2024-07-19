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
                .fill(Color(hex: "2d42d1"))
            Circle()
                .fill(Color(hex: "384cd3"))
                .frame(width: 100, height: 100)
                .position(CGPoint(x: 10.0, y: 75.0))
            Circle()
                .fill(Color(hex: "2d42d1"))
                .frame(width: 90, height: 80)
                .position(CGPoint(x: 10.0, y: 75.0))

            Circle()
                .fill(Color(hex: "384cd3"))
                .frame(width: 200, height: 200)
                .position(CGPoint(x: 350.0, y: 40.0))
            
            Circle()
                .fill(Color(hex: "2d42d1"))
                .frame(width: 180, height: 180)
                .position(CGPoint(x: 350.0, y: 40.0))
            
            Circle()
                .fill(Color(hex: "384cd3"))
                .frame(width: 100, height: 100)
                .position(CGPoint(x: 150.0, y: 150.0))
            Circle()
                .fill(Color(hex: "2d42d1"))
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
