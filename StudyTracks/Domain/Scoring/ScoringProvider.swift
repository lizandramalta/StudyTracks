//
//  ScoringProvider.swift
//  StudyTracks
//
//  Created by Lizandra Malta on 03/11/25.
//

struct ScoringProvider: Sendable {
    private let strategies: [ScoringMethod: any Scoring]
    
    init(
        strategies: [ScoringMethod: any Scoring] = [
            .simpleCompletion: SimpleCompletionScoring(),
            .timeWeighted: TimeWeightedScoring(),
            .effortWeighted: EffortWeightedScoring()
        ]
    ) {
        self.strategies = strategies
    }
    
    func strategy(for method: ScoringMethod) -> any Scoring {
        return strategies[method] ?? SimpleCompletionScoring()
    }
}
