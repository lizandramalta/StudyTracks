//
//  ExportFileProvider.swift
//  StudyTracks
//
//  Created by Lizandra Malta on 03/11/25.
//

struct ExportFileProvider: Sendable {
    private let strategies: [ExportFormat: any ExportFile]
    
    init(
        strategies: [ExportFormat: any ExportFile] = [
            .csv: CSVFormat(),
            .json: JSONFormat()
        ]
    ) {
        self.strategies = strategies
    }
    
    func strategy(for format: ExportFormat) -> any ExportFile {
        return strategies[format] ?? JSONFormat()
    }
}
