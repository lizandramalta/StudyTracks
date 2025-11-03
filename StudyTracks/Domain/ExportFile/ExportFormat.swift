//
//  ExportFormat.swift
//  StudyTracks
//
//  Created by Lizandra Malta on 31/10/25.
//

import Foundation

enum ExportFormat: String, CaseIterable, Identifiable, Sendable {
    case csv
    case json
    var id: String { rawValue }
    var fileExtension: String { self ==
        .csv ? "csv" : "json" }
}
