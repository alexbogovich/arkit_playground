//
//  ContentView.swift
//  AR playground
//
//  Created by Alex Bogovich on 14.11.2021.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
