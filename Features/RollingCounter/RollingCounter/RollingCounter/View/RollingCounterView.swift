//
//  RollingCounterView.swift
//  RollingCounter
//
//  Created by Phittaya Wongsuwan on 9/7/2565 BE.
//

import SwiftUI

struct RollingCounterView: View {
    @State var value: Int = 0

    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
                RollingTextView(font: .system(size: 55), weight: .black, value: $value)
                Button("Change Value") {
                    value = .random(in: 200 ... 1300)
                }
            }
            .padding()
            .frame(maxHeight: .infinity, alignment: .center)
            .navigationTitle("Rolling Counter")
            .navigationBarItems(leading: self.backButton())
        }
    }

    private func backButton() -> AnyView {
        return AnyView(
            Button(action: {
                RollingCounterScene.rolling.dismiss()
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

struct RollingCounterView_Previews: PreviewProvider {
    static var previews: some View {
        RollingCounterView()
    }
}
