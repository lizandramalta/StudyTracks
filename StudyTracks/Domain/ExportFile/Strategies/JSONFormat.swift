//
//  JSONFormat.swift
//  StudyTracks
//
//  Created by Lizandra Malta on 03/11/25.
//

import Foundation

struct JSONFormat: ExportFile {
    func export(track: LearningTrack) throws -> Data {
        return try JSONEncoder().encode(track)
    }
}
