//
//  LearningTrack.swift
//  StudyTracks
//
//  Created by Lizandra Malta on 31/10/25.
//

import Foundation

struct LearningTrack: Identifiable, Hashable, Codable, Sendable {
    var id: UUID = UUID()
    var title: String
    var goalDescription: String
    var scoringMethod: ScoringMethod
    var sessions: [StudySession] = []
}
