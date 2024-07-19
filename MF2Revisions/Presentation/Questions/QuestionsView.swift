//
//  QuestionsView.swift
//  MF2Revisions
//
//  Created by Nicolas Guyot on 18/07/2024.
//

import SwiftUI

struct QuestionsView: View {
    
    @State private var viewModel = ViewModel()
    @State private var answerHidden = true
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                HStack {
                    Text("Question n°\(viewModel.questionId): ")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding()
                    Spacer()
                }
                Text("\(viewModel.field) / \(viewModel.theme) / \(viewModel.date) / \(viewModel.city)")
                    .foregroundStyle(.white)
                
                ScrollView {
                    VStack {
                        
                        
            
                        Text("\(viewModel.question)?")
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .padding(20)

                        
                        Button("Réponse") {
                            answerHidden = !answerHidden
                        }.buttonStyle(GrowingButton())
                        
                        if !answerHidden {
                            
                            Text("\(viewModel.answer)")
                            .padding(20)
                            .background(.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(20)
                            
                            Button("Suivant") {
                                answerHidden = !answerHidden
                                viewModel.getNewQuestion()
                            }.buttonStyle(GrowingButton())
                        }
                    }
                }
                .onAppear(perform: viewModel.getNewQuestion)
            }
//            .navigationBarHidden(true)
//            .border(.red)
        }
    }
}



#Preview {
    QuestionsView()
}
