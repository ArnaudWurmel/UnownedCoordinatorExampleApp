//
//  Event.swift
//  CoordinatorDemoApp
//
//  Created by Arnaud Wurmel on 05/05/2026.
//

import Foundation

struct Event: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let date: Date
}
