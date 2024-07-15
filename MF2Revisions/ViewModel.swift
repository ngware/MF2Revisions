//
//  ViewModel.swift
//  MF2Revisions
//
//  Created by Nicolas Guyot on 08/07/2024.
//

import Foundation
import SwiftCSV


extension ContentView {
    @Observable
    class ViewModel {
        
        var data : Optional<Array<Dictionary<String, String>>> = nil
        var question = "Ma question?"
        var answer = "Ma reponse?"
        var questionId = -1
        var field = ""
        var theme = ""
        var city = ""
        var points = ""
        var date = ""
        
        init() {
            do {
                let resource: CSV? = try CSV<Named>(
                    name: "final_info_updated",
                    extension: "csv",
                    bundle: .main,
                    delimiter: .character(";"),  // Any character works!
                    encoding: .utf8)
                
                self.data = resource?.rows
                
//                self.getNewQuestion()
            } catch let parseError as CSVParseError {
                // Catch errors from parsing invalid CSV
                print("invalid CSV : \(parseError)")
                
            } catch {
                // Catch errors from trying to load files
                print("file not found : \(error)")
            }
            
        }
        
        func getNewQuestion() {
            self.questionId = getRandomQuestionIndex()
            let id = self.questionId - 1
            print("Index: \(self.questionId)")
            self.question = data?[id]["Question"] ?? "?"
            self.answer = data?[id]["Answer"] ?? "-"
            self.field = data?[id]["Field"] ?? "-"
            self.theme = data?[id]["Theme"] ?? "-"
            self.date = data?[id]["Date"] ?? "-"
            self.city = data?[id]["City"] ?? "-"
            self.points = data?[id]["Points"] ?? "-"
        }
        
        func getRandomQuestionIndex() -> Int {
            Int.random(in: 1..<(data?.count ?? 1))
        }
    }
    
}
