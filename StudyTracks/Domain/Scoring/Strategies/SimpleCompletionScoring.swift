//
//  SimpleCompletionScoring.swift
//  StudyTracks
//
//  Created by Lizandra Malta on 03/11/25.
//

struct SimpleCompletionScoring: Scoring {
    func score(for track: LearningTrack) -> ProgressBreakdown {
        let completed = Double(track.sessions.count)
        // alvo arbitrário: 20 sessões
        let score = min(completed / 20.0, 1.0)
        return .init(score: score, detail: "\(Int(completed)) sessões de 20")
    }
}
