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
    let provider: ScoringProvider
    
    init(provider: ScoringProvider = .init()) {
        self.provider = provider
    }
    
    func progress(for track: LearningTrack) -> ProgressBreakdown {
        guard !track.sessions.isEmpty else { return .init(score: 0, detail: "Sem sessões") }
        let strategy = provider.strategy(for: track.scoringMethod)
        return strategy.score(for: track)
    }
}


