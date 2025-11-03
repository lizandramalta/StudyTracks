//
//  ExportFile.swift
//  StudyTracks
//
//  Created by Lizandra Malta on 03/11/25.
//

import Foundation

protocol ExportFile {
    func export(track: LearningTrack) throws -> Data
}
