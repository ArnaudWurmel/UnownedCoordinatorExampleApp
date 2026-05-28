//
//  HomeCoordinator.swift
//  CoordinatorDemoApp
//
//  Created by Arnaud Wurmel on 05/05/2026.
//

import AWUIKit
import SwiftUI
import UIKit

class HomeCoordinator: UnownedCoordinator<UINavigationController> {
    override func start() {
        rootView?.setViewControllers(
            [
                UIHostingController(
                    rootView: HomeView(
                      navigationDelegate: self
                    )
                )
            ],
            animated: false
        )
    }
}

extension HomeCoordinator: HomeNavigationDelegate {
    func home(didSelect city: City) {
        guard let rootView else {
            return
        }
        start(
            DetailsCoordinator(city: city, rootView: rootView)
        )
    }
}
