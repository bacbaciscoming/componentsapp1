//
//  SeeMoreView.swift
//  SeeMore
//
//  Created by Phittaya Wongsuwan on 28/9/2565 BE.
//

import SwiftUI

struct SeeMoreView: View {
    
    @ObservedObject private var viewModel: SeeMoreViewModel
    
    init(viewModel: SeeMoreViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(.blue)
                        .frame(height: 50)
                    TopNavigationView(viewModel: TopNavigationViewModel(topNavList: viewModel.topNavList,
                                                                        focusIndex:
                                                                            $viewModel.focusIndex))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    switch viewModel.state {
                    case .idle:
                        Color.clear
                            .onAppear {
                                viewModel.getTopNevigation()
                            }
                    case .loading:
                        ProgressView()
                            .frame(width: 20, height: 20)
                            .padding()
                    case .failed:
                        EmptyView()
                    case .loaded:
                        let _ = print("💥 loaded SeeMoreView \(viewModel.focusIndex)")
                        Spacer()
                    }
                }
            }
            .navigationBarItems(leading: backButton())
            .navigationBarTitle("See More", displayMode: .automatic)
        }
    }
    
    private func backButton() -> AnyView {
        return AnyView(
            Button(action: {
                SeeMoreScene.seeMore.dismiss()
            }) {
                Image(systemName: "chevron.down")
                    .frame(width: 24, height: 24, alignment: .center)
                    .foregroundColor(Color.black)
            }
                .frame(width: 34, height: 34, alignment: .center)
                .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
        )
    }
}

struct SeeMoreView_Previews: PreviewProvider {
    static var previews: some View {
        SeeMoreView(viewModel: SeeMoreViewModel())
    }
}
