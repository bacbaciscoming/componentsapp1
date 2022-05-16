//
//  View+Extension.swift
//  ComponentsApp1
//
//  Created by Phittaya Wongsuwan on 2/5/2565 BE.
//

import SwiftUI

public extension View {
    func applyDominantColor() -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                AppColor.dominant
            )
    }
    
    func applySecondaryColor() -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                AppColor.secondary
            )
    }
    
    func applyAccentColor() -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                AppColor.accent
            )
    }
}


