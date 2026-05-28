//
//  AnyUnownedCoordinator.swift
//  CoordinatorDemoApp
//
//  Created by Arnaud Wurmel on 28/05/2026.
//

import Foundation

class AnyUnownedCoordinator: NSObject, AnyCoordinator {
    private var childCoordinators = NSHashTable<AnyUnownedCoordinator>.weakObjects()

    func start() {
        assertionFailure("AnyUnownedCoordinator.start() must be overridden")
    }
    
    deinit {
        print("\(String(describing: self)) deleted")
    }
}

extension AnyUnownedCoordinator {
    func addChild(_ child: AnyUnownedCoordinator) {
        childCoordinators.add(child)
    }

    func removeChild(_ child: AnyUnownedCoordinator) {
        childCoordinators.remove(child)
    }

    func start(_ child: AnyUnownedCoordinator) {
        addChild(child)

        child.start()
    }
}
