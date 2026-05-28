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
        coordinator: AWAnyCoordinator
    )
    func addEventCoordinator(
        didPressCancel coordinator: AWAnyCoordinator
    )
}

class AddEventCoordinator: AWCoordinator<UINavigationController> {
    weak var delegate: AddEventCoordinatorNavigationDelegate?

    init(delegate: AddEventCoordinatorNavigationDelegate) {
        self.delegate = delegate
        super.init(rootView: UINavigationController())
    }

    override func start() {
        rootView.setViewControllers(
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
