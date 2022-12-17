//
//  MainViewModel.swift
//  TestTaskSimplyTechnologies
//
//  Created by Hayk Aghavelyan on 17.12.22.
//

import Foundation

class MainViewModel {
    let tabs: [Tabs] = [.home, .vehicle, .location, .settings]
}

extension MainViewModel {
    enum Tabs: Int, CaseIterable, Identifiable {
        var id: Int { rawValue }

        case home, vehicle, location, settings

        var title: String {
            switch self {
                case .home: return "Home"
                case .vehicle: return "Vehicle"
                case .location: return "Location"
                case .settings: return "Setting"
            }
        }

        var imageName: String {
            switch self {
                case .home: return "house.fill"
                case .vehicle: return "car"
                case .location: return "location"
                case .settings: return "gearshape.fill"
            }
        }
    }
}
