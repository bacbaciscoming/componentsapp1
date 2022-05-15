//
//  TabBarView.swift
//  ComponentsApp1
//
//  Created by Phittaya Wongsuwan on 24/4/2565 BE.
//

#if !TESTING
import SwiftUI
import Tutorial
import Core
import Data

struct TabBarView: View {
    
    @EnvironmentObject var viewlaunchModel: ViewLaunchModel
    @Environment(\.colorScheme) var scheme
    @State var currentTab: Tab = .home
    
    // animate Splash
    @State var animate: Bool = false
    @State var endSplash: Bool = false
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                if self.viewlaunchModel.currentPage == .tutorial {
                    TutorialPageView(viewModel: TutorialPageViewModel())
                } else if self.viewlaunchModel.currentPage == .tabBar {
                    TabView(selection: $currentTab) {
                        Text("Home")
                            .tag(Tab.home)
                        Text("Search")
                            .tag(Tab.search)
                        Text("Map")
                            .tag(Tab.mapMarker)
                        Text("Setting")
                            .tag(Tab.setting)
                        VStack {
                            Text("Profile")
                        }
                        .tag(Tab.profile)
                        .frame(
                              minWidth: 0,
                              maxWidth: .infinity,
                              minHeight: 0,
                              maxHeight: .infinity
                            )
                        .background(Color.red)
                    }
                    CustomTabBarView(currentTab: $currentTab)
                }
            }
            .applyDominantColor()
            
            // splash
            ZStack {
                Color("Accent")
                Image("Twitter")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : 85, height: animate ? nil : 85)
                
                // scaling view
                    .scaleEffect(animate ? 3 : 1)
                // setting width to avoid over size
                    .frame(width: UIScreen.main.bounds.width)
                
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear {
                animateSplash()
            }
            // hiding view after finished...
            .opacity(endSplash ? 0 : 1)
        }
    }
    
    private func animateSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            
            // can adjust speed or wait until data loads...
            withAnimation(Animation.easeOut(duration: 0.55)) {
                animate.toggle()
            }
            withAnimation(Animation.linear(duration: 0.45)) {
                endSplash.toggle()
            }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView().environmentObject(ViewLaunchModel())
    }
}
#endif


