//
//  ExportService.swift
//  StudyTracks
//
//  Created by Lizandra Malta on 31/10/25.
//

import Foundation
struct ExportService: Sendable {
    func export(track: LearningTrack, as format: ExportFormat) throws ->
    Data {
        switch format {
        case .json:
            return try JSONEncoder().encode(track)
        case .csv:
            var lines =
            ["id,title,goalDescription,scoringMethod,sessionDate,durationMinutes,effortNote"]
            let df = ISO8601DateFormatter()
            for s in track.sessions {
                lines.append("\(track.id.uuidString),\(escape(track.title)),\(escape(track.goalDescription)),\(track.scoringMethod.rawValue),\(df.string(from: s.date)),\(s.durationMinutes),\(s.effortNote)")
            }
            return lines.joined(separator: "\n").data(using: .utf8) ?? Data()
        }
    }
    private func escape(_
                        s: String) -> String {
        if s.contains(",") { return "\"\(s)\"" } else { return s }
    }
}
