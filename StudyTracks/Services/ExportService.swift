//
//  ExportService.swift
//  StudyTracks
//
//  Created by Lizandra Malta on 31/10/25.
//

import Foundation

struct ExportService: Sendable {
    let provider: ExportFileProvider
    
    init(provider: ExportFileProvider = .init()) {
        self.provider = provider
    }
    
    func export(track: LearningTrack, as format: ExportFormat) throws -> Data {
        let strategy = provider.strategy(for: format)
        return try strategy.export(track: track)
    }
}
