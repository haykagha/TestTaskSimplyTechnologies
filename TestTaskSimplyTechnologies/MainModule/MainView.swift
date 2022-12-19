//
//  MainView.swift
//  TestTaskSimplyTechnologies
//
//  Created by Hayk Aghavelyan on 17.12.22.
//

import SwiftUI
import Combine


struct MainView: View {
    let viewModel: MainViewModel

    var body: some View {
        TabView {
            ForEach(viewModel.tabs) { tab in
                switch tab {
                    case .home:
                        HomeView(viewModel: HomeViewModel())
                            .tabItem {
                                Label(tab.title, systemImage: tab.imageName)
                            }
                    case .vehicle, .location, .settings:
                        EmptyView()
                            .tabItem {
                                Label(tab.title, systemImage: tab.imageName)
                            }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}
