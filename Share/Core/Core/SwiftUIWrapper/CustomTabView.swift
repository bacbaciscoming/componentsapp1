//
//  CustomTabView.swift
//  Core
//
//  Created by Phittaya Wongsuwan on 16/5/2565 BE.
//

#if !TESTING
    import SwiftUI

    public struct CustomTabView<Content: View>: View {
        @Binding var currentTab: Tabs
        var content: Content

        public init(currentTab: Binding<Tabs>, @ViewBuilder content: () -> Content) {
            _currentTab = currentTab
            self.content = content()
        }

        public var body: some View {
            TabView(selection: $currentTab) {
                content
            }
            CustomTabBarView(currentTab: $currentTab)
        }
    }
#endif
