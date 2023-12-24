//
//  TopNavigationView.swift
//  SeeMore
//
//  Created by Phittaya Wongsuwan on 28/9/2565 BE.
//

import SwiftUI

struct TopNavigationView: View {
    
    @ObservedObject private var viewModel: TopNavigationViewModel
    
    init(viewModel: TopNavigationViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        let _ = print("💥 loaded TopNavigationView \(viewModel.focusIndex.wrappedValue)")
        ScrollViewReader { scrollView in
            ScrollView(.horizontal,showsIndicators: false) {
                LazyHStack(spacing: 10) {
                    ForEach(Array(viewModel.topNavList.enumerated()), id: \.offset) { index, title in
                        VStack {
                            Text(title)
                                .fontWeight(.medium)
                                .fixedSize()
                            Spacer()
                            Rectangle()
                                .fill(index == viewModel.focusIndex.wrappedValue ? .black : .clear)
                                .frame(height: 3)
                        }
                        .gesture(
                            TapGesture().onEnded { _ in
                                if index != viewModel.focusIndex.wrappedValue {
                                    viewModel.focusIndex.wrappedValue = index
                                }
                            }
                        )
                    }
                }
                .frame(height: 40)
                .padding()
            }
            .background(.red)
        }
    }
}

struct TopNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TopNavigationView(viewModel: TopNavigationViewModel(topNavList: ["For you", "True Special", "Anime", "Thai Series", "Korea Series"],
                                                            focusIndex: .constant(0)))
    }
}
