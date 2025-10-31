//
//  InMemoryTrackRepository.swift
//  StudyTracks
//
//  Created by Lizandra Malta on 31/10/25.
//

import Foundation
@MainActor
final class InMemoryTrackRepository: TrackRepository {
    private var tracks: [LearningTrack]
    init(tracks: [LearningTrack] = SampleData.tracks) {
        self.tracks = tracks
    }
    func allTracks() -> [LearningTrack] { tracks }
    func upsert(_
                track: LearningTrack) {
        if let idx = tracks.firstIndex(where: { $0.id == track.id }) {
            tracks[idx] = track
        } else {
            tracks.append(track)
        }
    }
}
