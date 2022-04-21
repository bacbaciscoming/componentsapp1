//
//  ContentView.swift
//  ComponentsApp1
//
//  Created by Phittaya Wongsuwan on 19/4/2565 BE.
//

import SwiftUI
import Tutorial

struct ContentView: View {
    var body: some View {
        VStack {
            let _ = print(TestModular1.callModular())
        }
        .background(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
