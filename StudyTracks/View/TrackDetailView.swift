//
//  TrackDetailView.swift
//  StudyTracks
//
//  Created by Lizandra Malta on 31/10/25.
//

import SwiftUI
struct TrackDetailView: View {
    @State var viewModel: TrackDetailViewModel
    @State private var duration: Int = 25
    @State private var effort: Int = 3
    @State private var exportFormat: ExportFormat =
        .csv
    var body: some View {
        List {
            Section("Informações") {
                Text(viewModel.track.goalDescription)
                Picker("Pontuação", selection:
                        $viewModel.track.scoringMethod) {
                    ForEach(ScoringMethod.allCases) { m in
                        Text(m.displayName).tag(m)
                    }
                }
            }
            Section("Nova sessão") {Stepper("Duração: \(duration) min", value: $duration, in:
                                                5...180, step: 5)
                Stepper("Esforço: \(effort)"
                        , value: $effort, in: 1...5)
                Button("Adicionar sessão") { viewModel.addSession(duration:
                                                                    duration, effort: effort) }
            }
            Section("Próximo estudo") {
                Picker("Agendamento", selection: $viewModel.schedulingMode) {
                    ForEach(SchedulingMode.allCases) { m in
                        Text(m.rawValue).tag(m)
                    }
                }
                Text(viewModel.nextSuggestedDate(), style: .date)
            }
            Section("Exportar") {
                Picker("Formato", selection: $exportFormat) {
                    ForEach(ExportFormat.allCases) { f in
                        Text(f.rawValue.uppercased()).tag(f)
                    }
                }
                Button("Exportar") {
                    if let data = viewModel.export(exportFormat) {
                        print("Exportado (\(exportFormat.fileExtension)): \(data.count) bytes")
                    }
                }
            }
            Section("Sessões") {
                ForEach(viewModel.track.sessions) { s in
                    HStack {
                        Text(s.date, style: .date)
                        Spacer()
                        Text("\(s.durationMinutes) min · esforço \(s.effortNote)")
                    }
                }
            }
        }
        .navigationTitle(viewModel.track.title)
    }
}
