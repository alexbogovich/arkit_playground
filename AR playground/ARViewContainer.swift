//
// Created by Alex Bogovich on 14.11.2021.
//

import RealityKit
import ARKit
import SwiftUI

struct ARViewContainer: UIViewRepresentable {

    func makeUIView(context: Context) -> AppARView {
        let arView = AppARView(frame: .zero)
        arView.setupGestures()
        arView.loadPlayground()
        return arView

    }

    func updateUIView(_ uiView: AppARView, context: Context) {
    }

}