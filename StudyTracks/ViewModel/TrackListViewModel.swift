//
//  TrackListViewMoel.swift
//  StudyTracks
//
//  Created by Lizandra Malta on 31/10/25.
//

import Foundation

@MainActor
@Observable
final class TrackListViewModel {
    private(set) var tracks: [LearningTrack] = []
    let repository: any TrackRepository
    private let progressService = ProgressService()
    init(repository: any TrackRepository) {
        self.repository = repository
        load()
    }
    func load() {
        tracks = repository.allTracks()
    }
    func progress(for track: LearningTrack) -> ProgressBreakdown {
        progressService.progress(for: track)
    }
}
