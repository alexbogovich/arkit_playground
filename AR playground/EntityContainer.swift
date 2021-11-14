//
// Created by Alex Bogovich on 15.11.2021.
//

import RealityKit

class EntityContainer: Entity, HasCollision {
    required init(entity: Entity) {
        super.init()
        self.name = "entity_container"
        updateBody(entity: entity)
        updateCollision()
    }

    func updateCollision() {
        let bounds = self.visualBounds(relativeTo: nil)
        let shape = ShapeResource.generateBox(size: bounds.extents).offsetBy(translation: bounds.center)
        self.components[CollisionComponent.self] = CollisionComponent(shapes: [shape])
    }

    func updateBody(entity: Entity) {
        if let child = findEntity(named: "base_child") {
            removeChild(child)
        }
        entity.name = "base_child"
        addChild(entity)
    }
}
