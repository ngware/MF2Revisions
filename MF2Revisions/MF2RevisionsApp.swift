//
//  MF2RevisionsApp.swift
//  MF2Revisions
//
//  Created by Nicolas Guyot on 08/07/2024.
//

import SwiftUI


@main
struct MF2RevisionsApp: App {
    
    @StateObject private var manager : DataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
//            HomeView()
            QuestionsListView()
                .environmentObject(manager)
                .environment(\.managedObjectContext, manager.container.viewContext)
        }
    }
}
