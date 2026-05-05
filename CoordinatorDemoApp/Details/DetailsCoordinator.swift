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
    
    init(city: City, rootView: UINavigationController) {
        self.city = city
        super.init(rootView: rootView)
    }
    
    override func start() {
        rootView.pushViewController(
            UIHostingController(
                rootView: DetailsView(
                    navigationDelegate: self,
                    city: city
                )
            ),
            animated: true
        )
    }
}

extension DetailsCoordinator: DetailsNavigationDelegate {
    
}
