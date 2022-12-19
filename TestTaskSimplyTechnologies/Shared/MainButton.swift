//
//  MainButton.swift
//  TestTaskSimplyTechnologies
//
//  Created by Hayk Aghavelyan on 19.12.22.
//

import Foundation
import SwiftUI
import ActivityIndicatorView

struct MainButton: View {
    enum ButtonType {
        case lock, unlock, start, stop

        var title: String? {
            switch self {
                case .lock: return nil
                case .unlock: return nil
                case .start: return "START"
                case .stop: return "STOP"
            }
        }

        var imageName: String? {
            switch self {
                case .lock: return "lock"
                case .unlock: return "unlock"
                case .start: return nil
                case .stop: return nil
            }
        }

        var alertMessage: String {
            switch self {
                case .lock: return "Please confirm that you want to lock the doors of \"My QX55\""
                case .unlock: return "Please confirm that you want to unlock the doors of \"My QX55\""
                case .start: return "Please confirm that you want to start the engine of \"My QX55\""
                case .stop: return "Please confirm that you want to stop the engine of \"My QX55\""
            }
        }

        var alertPrimaryButtonText: String {
            switch self {
                case .lock: return "Yes, Lock"
                case .unlock: return "Yes, Unlock"
                case .start: return "Yes, Start"
                case .stop: return "Yes, Stop"
            }
        }
    }

    enum ButtonState {
        case initial, selected, highlighted, loading

        var backgroundColor: Color {
            switch self {
                case .selected: return Colors.orange_166_106_83
                case .loading: return Color.white
                default:  return Color.black
            }
        }

        var opacity: Double {
            switch self {
                case .highlighted: return 0.5
                default:  return 1
            }
        }
    }

    let type: ButtonType
    var action: (()->Void)?

    @State private var showingAlert = false
    @State private var showLoadingIndicator = true
    @State var state: ButtonState

    var body: some View {
        content
            .alert(isPresented:$showingAlert) {
                Alert(
                    title: Text("Are you sure?"),
                    message: Text(type.alertMessage),
                    primaryButton: .default(Text(type.alertPrimaryButtonText)
                        .fontWeight(.bold))
                    {
                        action?()
                    },
                    secondaryButton: .cancel())
            }
    }

    private var content: some View {
        Button {
            showingAlert = true
        } label: {
            VStack {
                if state == .loading {
                    ActivityIndicatorView(isVisible: $showLoadingIndicator, type: .growingArc(Colors.orange_166_106_83, lineWidth: 3))
                        .frame(width: 80, height: 80)
                        .foregroundColor(.red)
                } else {
                    createButton(with: type, state: state)
                }
            }
        }.disabled( type != .lock || state != .initial)
    }

    private func createButton(with type: ButtonType, state: ButtonState) -> some View {
        VStack {
            if let imageName = type.imageName {
                Image(imageName)
                    .resizable()
            }
            if let title = type.title {
                Text(title)
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(Color.white)
            }
        }
        .frame(width: 80, height: 80)
        .background(state.backgroundColor)
        .clipShape(Circle())
        .tint(.white)
        .scaledToFill()
        .opacity(state.opacity)
    }
}
