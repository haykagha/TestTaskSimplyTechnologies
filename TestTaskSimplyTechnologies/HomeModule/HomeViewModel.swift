//
//  HomeViewModel.swift
//  TestTaskSimplyTechnologies
//
//  Created by Hayk Aghavelyan on 17.12.22.
//

import Foundation
import SwiftUI
import ActivityIndicatorView
import Combine

struct Colors {
    static let orange_166_106_83 = Color(red: 166/255, green: 106/255, blue: 83/255)
    static let gray_136 = UIColor(red: 136, green: 136, blue: 136, alpha: 1)
}

enum Section: Int, CaseIterable, Identifiable {
    case door, engine

    var id: Int { rawValue }

    var title : String {
        switch self {
            case .door:
                return "Doors"
            case .engine:
                return "Engine"
        }
    }
}

class HomeViewModel: ObservableObject {
    private var bag = Set<AnyCancellable>()

    let sections: [Section] = [.door, .engine]

    deinit {
        bag.removeAll()
    }
}

