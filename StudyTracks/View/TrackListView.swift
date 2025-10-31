//
//  TrackListView.swift
//  StudyTracks
//
//  Created by Lizandra Malta on 31/10/25.
//

import SwiftUI

struct TrackListView: View {
    @Environment(TrackListViewModel.self) private var viewModel
    @State private var showingNew = false
    
    var body: some View {
        NavigationStack {
            List(viewModel.tracks) { track in
                NavigationLink(value: track) {
                    let p = viewModel.progress(for: track)
                    HStack {
                        VStack(alignment: .leading) {
                            Text(track.title).font(.headline)
                            Text(track.scoringMethod.displayName).font(.caption).foregroundStyle(.secondary)
                        }
                    }
                    Spacer()
                    ProgressView(value: p.score)
                        .frame(width: 120)
                        .accessibilityLabel("Progresso: \(Int(p.score*100))% — \(p.detail)")
                }
            }
            .navigationTitle("StudyTracks").toolbar {
                Button("Nova") { showingNew = true }
            }
            .navigationDestination(for: LearningTrack.self) { track in
                TrackDetailView(viewModel: TrackDetailViewModel(track:
                                                                    track, repository: viewModel.repository))
            }
            .sheet(isPresented: $showingNew) {
                AddSessionView(onCreate: { title, desc, method in
                    let t = LearningTrack(title: title, goalDescription:
                                            desc, scoringMethod: method)
                    viewModel.repository.upsert(t)
                    viewModel.load()
                })
                .presentationDetents([.medium])
            }
        }
    }
    
}
