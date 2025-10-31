//
//  AddSessionView.swift
//  StudyTracks
//
//  Created by Lizandra Malta on 31/10/25.
//

import SwiftUI

struct AddSessionView: View {
    var onCreate: (String, String, ScoringMethod) -> Void
    @Environment(\.dismiss) private var dismiss
    @State private var title: String = "Nova Trilha"
    @State private var desc: String = "Descreva seu objetivo de aprendizagem"
    @State private var method: ScoringMethod =
        .simpleCompletion
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Título", text: $title)
                TextField("Descrição", text: $desc)
                Picker("Pontuação", selection: $method) {
                    ForEach(ScoringMethod.allCases) { m in
                        Text(m.displayName).tag(m)
                    }
                }
            }
            .navigationTitle("Nova Trilha")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Fechar") { dismiss() } }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Criar") { onCreate(title, desc, method); dismiss() } }
            }
        }
    }
}
