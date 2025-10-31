//
//  StudyTracksApp.swift
//  StudyTracks
//
//  Created by Lizandra Malta on 31/10/25.
//

import SwiftUI

@main
struct StudyTracksApp: App {
    @State private var repository: any TrackRepository = InMemoryTrackRepository()
    
    var body: some Scene {
        WindowGroup {
            TrackListView()
                .environment(TrackListViewModel(repository: repository))
        }
    }
}
