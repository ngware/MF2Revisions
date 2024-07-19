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
            
            Group {
                
                ScrollView {
                    VStack {
                        
                        Text("Question n°\(viewModel.questionId): ")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        Text("\(viewModel.field) / \(viewModel.theme) / \(viewModel.date) / \(viewModel.city)")
                            .foregroundStyle(.white)
            
                        Text("\(viewModel.question)?")
                            .padding(20)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .foregroundStyle(.white)
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
                
            }
//            .border(.red)
            
        }
    }
}



#Preview {
    QuestionsView()
}
