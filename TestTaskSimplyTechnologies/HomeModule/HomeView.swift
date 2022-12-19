//
//  HomeView.swift
//  TestTaskSimplyTechnologies
//
//  Created by Hayk Aghavelyan on 17.12.22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    @State var doorsViewstate: DoorsView.State = .initial

    var body: some View {
        GeometryReader { metrics in
            NavigationView {
                ZStack {
                    VStack {
                        Rectangle()
                            .fill(LinearGradient(
                                gradient: .init(colors: [Color(UIColor.systemGray4), .white]),
                                startPoint: .top,
                                endPoint: .bottom
                            ))
                            .frame(height: metrics.size.height * 0.2)
                        Spacer()
                    }
                    VStack(spacing: 0) {
                        HStack {
                            Button(action: {
                                print("Refresh pressed")

                            }) {
                                Image("refresh")
                            }
                            Text("Updated 1min ago")
                                .bold()
                                .foregroundColor(Color(UIColor.gray))
                        }.padding()
                        ScrollView(.horizontal) {
                            HStack {
                                Image("QX50 SPORT")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .background(.clear)
                                Image("QX50 AUTOGRAPH AWD")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .background(.clear)
                                Image("QX50")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .background(.clear)
                            }
                            .frame(height:  0.4 * metrics.size.height)
                        }
                        HStack {
                            ForEach(viewModel.sections) { section in
                                VStack(alignment: .leading) {
                                    Text(section.title)
                                        .font(.system(size: 18, weight: .bold))
                                    sectionView(section: section, state: doorsViewstate)
                                        .padding(10)
                                        .frame(width: (metrics.size.width - 20) / 2, height: 100)
                                        .background(Color.white)
                                        .cornerRadius(10)

                                }
                            }
                        }
                        .padding(10)
                        Spacer()
                    }
                }
                .background(Color(UIColor.systemGray5))
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(.white, for: .navigationBar)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack(spacing:0) {
                            Text("My QX55")
                                .font(.custom("Iowan Old Style", size: 20))
                                .padding(.trailing, 5)
                            Text("|")
                                .font(.system(size: 25))
                            Image("notif_gas")
                            Text("120 mi")
                                .font(.system(size: 14, weight: .bold))
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private func sectionView(section: Section, state: DoorsView.State) -> some View {
        GeometryReader { metrics in
            switch section {
                case .door:
                    switch state {
                        case .initial:
                            DoorsView(lockState: .initial, unlockState: .initial) {
                                doorsViewstate = .loading
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                                    doorsViewstate = .selected
                                }
                            }
                        case .loading:
                            DoorsView(lockState: .loading, unlockState: .highlighted) {
                                doorsViewstate = .selected
                            }
                        case .selected:
                            DoorsView(lockState: .selected, unlockState: .initial, action: nil)
                    }
                case .engine:
                    HStack {
                        MainButton(type: .start, state: .initial)
                        MainButton(type: .stop, state: .initial)
                    }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
