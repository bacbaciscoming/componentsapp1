//
//  TabBarView.swift
//  ComponentsApp1
//
//  Created by Phittaya Wongsuwan on 24/4/2565 BE.
//

#if !TESTING
import SwiftUI
import Tutorial
import Login
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
                    CustomTabView(currentTab: $currentTab) {
                        Text("Home")
                            .tag(Tab.home)
                        Text("Search")
                            .tag(Tab.search)
                        Text("Map")
                            .tag(Tab.mapMarker)
                        Text("Setting")
                            .tag(Tab.setting)
                        ProfileTabView()
                            .tag(Tab.profile)
                    }
                }
            }
            .applyDominantColor()
            
            // splash
            ZStack {
                AppColor.accent
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

struct ProfileTabView : View {
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack {
                    Button {
                        self.login()
                    } label: {
                        Text(UserDefaultsKey.IsLogin.bool ? "Logout" : "Login")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.blue)
                            )
                        
                    }
                }
                .padding(.top, 20)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.automatic)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func login() {
        let scene = LoginScene.login
        let transition: SceneTransitionType = .present(scene: scene, animated: true)
        let coordinator: SceneCoordinator = SceneCoordinator()
        coordinator.transition(type: transition)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView().environmentObject(ViewLaunchModel())
    }
}
#endif


