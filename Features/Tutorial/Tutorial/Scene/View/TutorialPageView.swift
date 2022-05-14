//
//  TutorialPageView.swift
//  Tutorial
//
//  Created by Phittaya Wongsuwan on 21/4/2565 BE.
//

#if !TESTING
import SwiftUI
import Data
import Core

public struct TutorialPageView: View {
    
    @EnvironmentObject var viewlaunchModel: ViewLaunchModel
    @ObservedObject private var viewModel: TutorialPageViewModel
    private let dotApperance = UIPageControl.appearance()
    
    public init(viewModel: TutorialPageViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        ZStack {
            Color.clear
            switch self.viewModel.state {
            case .idle:
                EmptyView()
            case .loaded:
                TabView(selection: $viewModel.pageIndex) {
                    ForEach(viewModel.tutorials, id: \.self) { tutorial in
                        VStack {
                            Spacer()
                            TutorialView(tutorial: tutorial)
                            Spacer()
                            if tutorial == self.viewModel.tutorials.last {
                                Button("Understand", action: {
                                    UserDefaultsKey.LaunchBefore.set(value: true)
                                    withAnimation(){
                                        self.viewlaunchModel.currentPage = .tabBar
                                    }
                                })
                                .buttonStyle(.bordered)
                            } else {
                                Button("Next",
                                       action: self.viewModel.increasePage)
                            }
                            Spacer()
                        }
                        .tag(tutorial.tag)
                    }
                }
                .animation(.easeOut, value: self.viewModel.pageIndex)
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                .onAppear {
                    self.dotApperance.currentPageIndicatorTintColor = .black
                    self.dotApperance.pageIndicatorTintColor = .gray
                }
            }
        }
    }
}

struct TutorialPageView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialPageView(viewModel: TutorialPageViewModel())
    }
}
#endif
