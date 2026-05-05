//
//  HomeCoordinator.swift
//  CoordinatorDemoApp
//
//  Created by Arnaud Wurmel on 05/05/2026.
//

import AWUIKit
import SwiftUI
import UIKit

class HomeCoordinator: AWCoordinator<UINavigationController> {
    override func start() {
        rootView.setViewControllers(
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
    
}
