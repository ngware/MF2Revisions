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
        
        var question = "Ma question?"
        var answer = "Ma reponse?"
        
        func parseCSV() {
            do {
                let resource: CSV? = try CSV<Named>(
                    name: "datamf2",
                    extension: "csv",
                    bundle: .main,
                    delimiter: .character(","),  // Any character works!
                    encoding: .utf8)
                
                self.question = resource?.rows[0]["Question"] ?? "?"
                self.answer = resource?.rows[0]["Answer"] ?? "!"
            } catch let parseError as CSVParseError {
                // Catch errors from parsing invalid CSV
                print("invalid CSV : \(parseError)")
            } catch {
                // Catch errors from trying to load files
                print("file not found : \(error)")
            }
        }
    }
    
}
