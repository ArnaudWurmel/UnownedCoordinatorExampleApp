//
//  EventDetailsView.swift
//  CoordinatorDemoApp
//
//  Created by Arnaud Wurmel on 05/05/2026.
//

import SwiftUI

protocol EventDetailsNavigationDelegate: AnyObject {
    // implement delegate methods
}

struct EventDetailsView: View {
    weak var navigationDelegate: EventDetailsNavigationDelegate?
    let event: Event

    var body: some View {
        List {
            Section {
                VStack(alignment: .leading, spacing: 8) {
                    Text(event.title)
                        .font(.largeTitle.bold())
                    Text(event.subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 8)
            }

            Section("Date") {
                Label(event.date.formatted(date: .long, time: .omitted), systemImage: "calendar")
            }
        }
        .navigationTitle(event.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
