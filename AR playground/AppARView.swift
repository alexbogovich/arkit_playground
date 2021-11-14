//
// Created by Alex Bogovich on 15.11.2021.
//

import ARKit
import RealityKit

func createGrayCube() -> Entity {
    ModelEntity(mesh: .generateBox(size: 3), materials: [SimpleMaterial(
            color: .gray,
            isMetallic: false)
    ])
}

func createGreenCube() -> Entity {
    ModelEntity(mesh: .generateBox(size: 3), materials: [SimpleMaterial(
            color: .green,
            isMetallic: false)
    ])
}

class AppARView: ARView {
    func setupGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        addGestureRecognizer(tap)
        addGestureRecognizer(longPress)
    }

    var counter = 0

    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        self.counter = self.counter + 1
        guard let touchInView = sender?.location(in: self) else {
            return
        }
        guard let activeEntity = entity(at: touchInView) else {
            return
        }

        print("Tab on: \(activeEntity.name) \(activeEntity.id)")

        if let container = activeEntity as? EntityContainer {
            if counter % 2 == 1 {
                container.updateBody(entity: createGrayCube())
            } else {
                container.updateBody(entity: createGreenCube())
            }
        }
    }

    @objc func handleLongPress(_ sender: UITapGestureRecognizer? = nil) {
        guard let touchInView = sender?.location(in: self) else {
            return
        }
        guard let activeEntity = entity(at: touchInView) else {
            return
        }

        print("Long press on: \(activeEntity.name) \(activeEntity.id)")

    }
}


extension AppARView {
    func loadPlayground() {
        #if !targetEnvironment(simulator)
        let anchorEntity = AnchorEntity(plane: .any)
        #else
        let anchorEntity = AnchorEntity()
        #endif
        scene.addAnchor(anchorEntity)

        let entityContainer = EntityContainer(entity: createGrayCube())
        anchorEntity.addChild(entityContainer)

        print("Create entity id= \(entityContainer.id) name= \(entityContainer.name)")
    }
}