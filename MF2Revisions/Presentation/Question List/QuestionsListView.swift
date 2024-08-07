//
//  QuestionListView.swift
//  MF2Revisions
//
//  Created by Nicolas Guyot on 07/08/2024.
//

import SwiftUI

struct QuestionsListView: View {

    @EnvironmentObject var manager: DataManager
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(
        entity: Question.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Question.id, ascending: true)]
    ) var questions: FetchedResults<Question>
    
    var body: some View {
        VStack {
            List(questions) { question in
                HStack {
                    Text(String(question.id))
                        .font(.headline)
                    Spacer()
                    Text("Views: \(question.viewCount)")
                        .font(.subheadline)
                }
            }
            
            if let randomQuestion = questions.randomElement() {
                HStack {
                    Text(String(randomQuestion.id))
                        .font(.headline)
                    Spacer()
                    Text("Views: \(randomQuestion.viewCount)")
                        .font(.subheadline)
                }
                Button("Mark as Viewed") {
                    randomQuestion.viewCount += 1
                    saveContext()
                }
            } else {
                Text("No questions available")
            }
        }
        .padding()
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

#Preview {
    QuestionsListView()
}
