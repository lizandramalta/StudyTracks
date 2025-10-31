//
//  ProgressService.swift
//  StudyTracks
//
//  Created by Lizandra Malta on 31/10/25.
//

import Foundation

struct ProgressBreakdown: Sendable {
    let score: Double // 0..1
    let detail: String
}
struct ProgressService: Sendable {
    func progress(for track: LearningTrack) -> ProgressBreakdown {
        let sessions = track.sessions
        guard !sessions.isEmpty else { return .init(score: 0, detail: "Sem sessões") }
        switch track.scoringMethod {
        case .simpleCompletion:
            let completed = Double(sessions.count)
            // alvo arbitrário: 20 sessões
            let score = min(completed / 20.0, 1.0)
            return .init(score: score, detail: "\(Int(completed)) sessões de 20")
        case .timeWeighted:
            let totalMinutes = sessions.reduce(0) { $0 + $1.durationMinutes }
            // alvo arbitrário: 600 min (10h)
            let score = min(Double(totalMinutes) / 600.0, 1.0)
            return .init(score: score, detail: "\(totalMinutes) min de 600")
        case .effortWeighted:
            let effort = sessions.reduce(0) { $0 + $1.effortNote }
            // alvo arbitrário: 60 pontos (média 3 em 20 sessões)
            let score = min(Double(effort) / 60.0, 1.0)
            return .init(score: score, detail: "Esforço acumulado: \(effort)/ 60")
        }
    }
}

