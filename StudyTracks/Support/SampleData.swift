//
//  SampleData.swift
//  StudyTracks
//
//  Created by Lizandra Malta on 31/10/25.
//

import Foundation
enum SampleData {
    static let tracks: [LearningTrack] = {
        var swift = LearningTrack(title: "Estudar Swift Concurrency",
                                  goalDescription: "Aprender Task, actors, Sendable e Structured Concurrency",
                                  scoringMethod: .timeWeighted,
                                  sessions: [])
        swift.sessions.append(.init(date: .now.addingTimeInterval(-86400*3),
                                    durationMinutes: 40, effortNote: 3))
        swift.sessions.append(.init(date: .now.addingTimeInterval(-86400*1),
                                    durationMinutes: 55, effortNote: 4))
        var design = LearningTrack(title: "Design para iOS",
                                   goalDescription:
                                    "Estudar HIG e padrões de layout",scoringMethod: .simpleCompletion,
                                   sessions: [])
        design.sessions.append(.init(date: .now.addingTimeInterval(-86400*7),
                                     durationMinutes: 25, effortNote: 2))
        return [swift, design]
    }()
}
