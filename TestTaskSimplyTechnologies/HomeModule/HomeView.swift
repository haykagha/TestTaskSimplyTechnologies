//
//  HomeView.swift
//  TestTaskSimplyTechnologies
//
//  Created by Hayk Aghavelyan on 17.12.22.
//

import SwiftUI

struct HomeView: View {

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
                    VStack(spacing: 5) {
                        HStack {
                            Button(action: {
                                print("Refresh pressed")

                            }) {
                                Image("refresh")
                            }
                            Text("Updated 1min ago")
                                .bold()
                                .foregroundColor(Color(UIColor.gray))
                        }
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
                            .frame(height:  0.45 * metrics.size.height)
                        }
                        Text("- - -+")
                        Spacer()
                    }.padding()
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
