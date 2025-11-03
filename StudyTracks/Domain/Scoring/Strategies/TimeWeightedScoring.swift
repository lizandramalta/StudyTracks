//
//  TimeWeightedScoring.swift
//  StudyTracks
//
//  Created by Lizandra Malta on 03/11/25.
//

struct TimeWeightedScoring: Scoring {
    func score(for track: LearningTrack) -> ProgressBreakdown {
        let totalMinutes = track.sessions.reduce(0) { $0 + $1.durationMinutes }
        // alvo arbitrário: 600 min (10h)
        let score = min(Double(totalMinutes) / 600.0, 1.0)
        return .init(score: score, detail: "\(totalMinutes) min de 600")
    }
}
