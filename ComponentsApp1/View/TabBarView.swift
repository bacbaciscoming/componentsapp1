//
//  TabBarView.swift
//  ComponentsApp1
//
//  Created by Phittaya Wongsuwan on 24/4/2565 BE.
//

import SwiftUI

struct TabBarView: View {
    
    @State var selectedTab = "house.fill"
    @Environment(\.colorScheme) var scheme
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Home")
                .tag("house.fill")
            Text("Search")
                .tag("magnifyingglass")
            Text("Video")
                .tag("airplayvideo")
            Text("Like")
                .tag("suit.heart.fill")
            Text("Profile")
                .tag("person.circle")
        }
        .overlay(
            VStack(spacing: 12) {
                Divider()
                    .padding(.horizontal, -15)
                HStack(spacing: 0) {
                    TabBarButton(image: "house.fill",
                                 title: "Home",
                                 selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                    TabBarButton(image: "magnifyingglass",
                                 title: "Search",
                                 selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                    TabBarButton(image: "airplayvideo",
                                 title: "Video",
                                 selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                    TabBarButton(image: "suit.heart.fill",
                                 title: "Like",
                                 selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                    TabBarButton(image: "person.circle",
                                 title: "Profile",
                                 selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal)
                .padding(.bottom,
                         UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 15)
            .background(scheme == .dark ? Color.black : Color.white)
            
            ,alignment: .bottom
        )
        .ignoresSafeArea()
    }
}

struct TabBarButton: View {
    
    var image: String
    var title: String
    @Binding var selectedTab: String
    
    var body: some View {
        Button {
            selectedTab = image
        } label: {
            VStack {
                Image(systemName: image)
                    .font(.title2)
                    .foregroundColor(selectedTab == image ? .primary : .gray)
            }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
