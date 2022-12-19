//
//  DoorsView.swift
//  TestTaskSimplyTechnologies
//
//  Created by Hayk Aghavelyan on 19.12.22.
//

import Foundation
import SwiftUI

struct DoorsView: View {
    enum State {
        case initial
        case loading
        case selected
    }

    let lockState: MainButton.ButtonState
    let unlockState: MainButton.ButtonState
    let action: (()->Void)?

    var body: some View {
        content
    }

    private var content: some View {
        HStack {
            MainButton(type: .lock, action: action, state: lockState)
            MainButton(type: .unlock, action: action, state: unlockState)
        }
    }
}
