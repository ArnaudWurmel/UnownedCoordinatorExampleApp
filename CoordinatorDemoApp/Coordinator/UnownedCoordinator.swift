//
//  UnownedCoordinator.swift
//  CoordinatorDemoApp
//
//  Created by Arnaud Wurmel on 28/05/2026.
//

class UnownedCoordinator<RootView: AnyObject>: AnyUnownedCoordinator {
    public private(set) weak var rootView: RootView?

    init(rootView: RootView) {
        self.rootView = rootView
    }
}
