//
//  String+CSVRows.swift
//  MF2Revisions
//
//  Created by Nicolas Guyot on 07/08/2024.
//

import Foundation

extension String {
    func csvRows() -> [[String]] {
        let rows = self.components(separatedBy: "\n")
        return rows.map { $0.components(separatedBy: ";") }
    }
}
