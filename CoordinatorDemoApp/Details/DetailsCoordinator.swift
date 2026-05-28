//
//  DetailsCoordinator.swift
//  CoordinatorDemoApp
//
//  Created by Arnaud Wurmel on 05/05/2026.
//

import AWUIKit
import SwiftUI
import UIKit

class DetailsCoordinator: AWCoordinator<UINavigationController> {
    private let city: City
    private let eventStore = EventStore()

    init(city: City, rootView: UINavigationController) {
        self.city = city
        super.init(rootView: rootView)
    }

    override func start() {
        rootView.pushViewController(
            UIHostingController(
                rootView: DetailsView(
                    navigationDelegate: self,
                    city: city,
                    eventStore: eventStore
                )
            ),
            animated: true
        )
    }
}

extension DetailsCoordinator: DetailsNavigationDelegate {
    func details(didSelect event: Event) {
        rootView.pushViewController(
            UIHostingController(
                rootView: EventDetailsView(
                    navigationDelegate: self,
                    event: event
                )
            ),
            animated: true
        )
    }

    func detailsDidTapAddEvent() {
        let addEventCoordinator = AddEventCoordinator(delegate: self)
        start(childCoordinator: addEventCoordinator)
        rootView.present(addEventCoordinator.rootView, animated: true)
    }
}

extension DetailsCoordinator: EventDetailsNavigationDelegate {

}

extension DetailsCoordinator: AddEventCoordinatorNavigationDelegate {
    func addEventCoordinator(
        didSave event: Event,
        coordinator: any AWAnyCoordinator
    ) {
        eventStore.add(event)

        rootView.dismiss(animated: true) { [weak self] in
            self?.remove(childCoordinator: coordinator)
        }

    }
    
    func addEventCoordinator(didPressCancel coordinator: any AWAnyCoordinator) {
        rootView.dismiss(animated: true) { [weak self] in
            self?.remove(childCoordinator: coordinator)
        }
    }
}
