//
//  TrackRepository.swift
//  StudyTracks
//
//  Created by Lizandra Malta on 31/10/25.
//

import Foundation
@MainActor
protocol TrackRepository: AnyObject, Sendable {
    func allTracks() -> [LearningTrack]
    func upsert(_
                track: LearningTrack)
}
