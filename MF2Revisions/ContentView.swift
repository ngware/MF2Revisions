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
        ZStack {
            
            ScrollView {
                VStack {
                    
                    Text("Question n°\(viewModel.questionId): ")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("\(viewModel.field) / \(viewModel.theme) / \(viewModel.date) / \(viewModel.city)")
        
                    Text("\(viewModel.question)?")
                        .padding(20)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
    //                    .clipShape(Capsule())

                    
                    Button("Réponse") {
                        answerHidden = !answerHidden
                    }.buttonStyle(GrowingButton())
                    
                    if !answerHidden {
                        
                        Text("\(viewModel.answer)")
                        .padding(20)
                        .background(.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                        Button("Suivant") {
                            answerHidden = !answerHidden
                            viewModel.getNewQuestion()
                        }.buttonStyle(GrowingButton())
                    }
                }.padding()
            }
//                .frame(width: size.width, height: size.height)
            .onAppear(perform: viewModel.getNewQuestion)
            .padding()
            .edgesIgnoringSafeArea(.all)
            
        }
//            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Image("background")
            .resizable()
            .clipped()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
        )
        
        
    }
}

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}



#Preview {
    ContentView()
}
