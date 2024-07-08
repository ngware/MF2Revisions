//
//  ContentView.swift
//  MF2Revisions
//
//  Created by Nicolas Guyot on 08/07/2024.
//

import SwiftUI
import SwiftCSV

struct ContentView: View {
    
    @State private var viewModel = ViewModel()
    @State private var answerHidden = true
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("\(viewModel.question)?")
            
            Button("Réponse") {
                answerHidden = !answerHidden
            }
            
            if !answerHidden {
                Text("\(viewModel.answer)")
            }
        }
        .onAppear(perform: viewModel.parseCSV)
        .padding()
    }
    
    
    
    
}

#Preview {
    ContentView()
}
