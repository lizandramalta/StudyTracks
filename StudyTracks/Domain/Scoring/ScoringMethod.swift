//
//  ScoringMethod.swift
//  StudyTracks
//
//  Created by Lizandra Malta on 31/10/25.
//

import Foundation

enum ScoringMethod: String, CaseIterable, Codable, Sendable, Identifiable {
    case simpleCompletion // cada sessão vale 1
    case timeWeighted // pondera por tempo
    case effortWeighted // pondera por nota de esforço
    var id: String { rawValue }
    var displayName: String {
        switch self {
        case .simpleCompletion: return "Contagem de sessões"
        case .timeWeighted: return "Ponderado por tempo"
        case .effortWeighted: return "Ponderado por esforço"
        }
    }
}
