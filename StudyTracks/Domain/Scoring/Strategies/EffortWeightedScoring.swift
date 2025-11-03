//
//  EffortWeightedScoring.swift
//  StudyTracks
//
//  Created by Lizandra Malta on 03/11/25.
//

struct EffortWeightedScoring: Scoring {
    func score(for track: LearningTrack) -> ProgressBreakdown {
        let effort = track.sessions.reduce(0) { $0 + $1.effortNote }
        // alvo arbitrário: 60 pontos (média 3 em 20 sessões)
        let score = min(Double(effort) / 60.0, 1.0)
        return .init(score: score, detail: "Esforço acumulado: \(effort)/ 60")
    }
}
