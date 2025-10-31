//
//  TrackDetailViewModel.swift
//  StudyTracks
//
//  Created by Lizandra Malta on 31/10/25.
//

import Foundation

@MainActor
@Observable
final class TrackDetailViewModel {
    var track: LearningTrack
    var schedulingMode: SchedulingMode =
        .fixedInterval
    private let repository: any TrackRepository
    private let scheduling = SchedulingService()
    private let exportService = ExportService()
    init(track: LearningTrack, repository: any TrackRepository) {
        self.track = track
        self.repository = repository
    }
    func addSession(duration: Int, effort: Int) {
        let session = StudySession(date: .now, durationMinutes: duration,
                                   effortNote: effort)
        track.sessions.append(session)
        repository.upsert(track)
    }
    func nextSuggestedDate() -> Date {
        let last = track.sessions.sorted { $0.date < $1.date }.last?.date
        let lastEffort = track.sessions.last?.effortNote
        return scheduling.nextDate(from: last, mode: schedulingMode,
                                   lastEffort: lastEffort)
    }
    func export(_
                format: ExportFormat) -> Data? {
        try? exportService.export(track: track, as: format)
    }
}
