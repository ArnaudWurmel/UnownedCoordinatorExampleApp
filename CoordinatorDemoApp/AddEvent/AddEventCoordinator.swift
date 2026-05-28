//
//  AddEventCoordinator.swift
//  CoordinatorDemoApp
//
//  Created by Arnaud Wurmel on 05/05/2026.
//

import AWUIKit
import SwiftUI
import UIKit

protocol AddEventCoordinatorNavigationDelegate: AnyObject {
    func addEventCoordinator(
        didSave event: Event,
        coordinator: AnyUnownedCoordinator
    )
    func addEventCoordinator(
        didPressCancel coordinator: AnyUnownedCoordinator
    )
}

class AddEventCoordinator: UnownedCoordinator<UINavigationController> {
    weak var delegate: AddEventCoordinatorNavigationDelegate?

    init(
        rootView: UINavigationController,
        delegate: AddEventCoordinatorNavigationDelegate
    ) {
        self.delegate = delegate
        super.init(rootView: rootView)
    }

    override func start() {
        rootView?.setViewControllers(
            [UIHostingController(rootView: AddEventView(navigationDelegate: self))],
            animated: false
        )
    }
}

extension AddEventCoordinator: AddEventNavigationDelegate {
    func addEvent(didSave event: Event) {
        delegate?.addEventCoordinator(didSave: event, coordinator: self)
    }

    func addEventDidCancel() {
        delegate?.addEventCoordinator(didPressCancel: self)
    }
}
