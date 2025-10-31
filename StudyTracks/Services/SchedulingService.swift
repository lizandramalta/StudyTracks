//
//  SchedulingService.swift
//  StudyTracks
//
//  Created by Lizandra Malta on 31/10/25.
//

import Foundation

enum SchedulingMode: String, CaseIterable, Identifiable, Sendable {
    case fixedInterval // sempre +2 dias
    case performanceAdaptive // se esforço alto, +3 dias; baixo, +1
    var id: String { rawValue }
}

struct SchedulingService: Sendable {
    func nextDate(from last: Date?, mode: SchedulingMode, lastEffort: Int?) -> Date {
        let base = last ?? .now
        switch mode {
        case .fixedInterval:
            return Calendar.current.date(byAdding: .day, value: 2, to:
                                            base) ?? base
        case .performanceAdaptive:
            let delta = (lastEffort ?? 3) >= 4 ? 3 : 1
            return Calendar.current.date(byAdding: .day, value: delta, to:
                                            base) ?? base
        }
    }
}
