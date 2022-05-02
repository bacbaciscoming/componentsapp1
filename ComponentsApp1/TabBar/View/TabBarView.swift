//
//  TabBarView.swift
//  ComponentsApp1
//
//  Created by Phittaya Wongsuwan on 24/4/2565 BE.
//

import SwiftUI

struct TabBarView: View {
    
    @State var currentTab: Tab = .home
    @Environment(\.colorScheme) var scheme
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentTab) {
                Text("Home")
                    .tag(Tab.home)
                Text("Search")
                    .tag(Tab.search)
                Text("Like")
                    .tag(Tab.like)
                Text("Profile")
                    .tag(Tab.profile)
                Text("Setting")
                    .tag(Tab.setting)
            }
            CustomTabBar(currentTab: $currentTab)
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
