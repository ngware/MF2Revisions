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
    
    @FetchRequest(sortDescriptors: []) private var questions: FetchedResults<Question>
    
    var body: some View {
        NavigationView {
            Text("test")
            List {
                ForEach(questions, id: \.self) { question in
                    Text("test")
                        .font(.title3)
                }
            }
        }
        .navigationTitle("Question List")
    }
}

#Preview {
    QuestionsListView()
}
