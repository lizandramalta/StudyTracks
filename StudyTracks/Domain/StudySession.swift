//
//  StudySession.swift
//  StudyTracks
//
//  Created by Lizandra Malta on 31/10/25.
//

import Foundation

struct StudySession: Identifiable, Hashable, Codable, Sendable {
    var id: UUID = UUID()
    var date: Date
    var durationMinutes: Int
    var effortNote: Int // 1..5
}
