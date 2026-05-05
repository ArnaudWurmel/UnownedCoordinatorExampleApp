//
//  DetailsView.swift
//  CoordinatorDemoApp
//
//  Created by Arnaud Wurmel on 05/05/2026.
//

import SwiftUI

protocol DetailsNavigationDelegate: AnyObject {
    // implement delegate methods
}

struct DetailsView: View {
    weak var navigationDelegate: DetailsNavigationDelegate?
    let city: City

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Color.secondary
                    .frame(maxWidth: .infinity)
                    .frame(height: 280)
                    .overlay {
                        AsyncImage(url: city.imageURL) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()
                            case .empty:
                                ProgressView()
                            default:
                                EmptyView()
                            }
                        }
                    }
                    .clipped()

                VStack(alignment: .leading, spacing: 8) {
                    Text(city.name)
                        .font(.largeTitle.bold())
                    Text("Canton \(city.canton)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(20)

                Divider()
                    .padding(.horizontal, 20)

                Text("Events")
                    .font(.title2.bold())
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 12)

                VStack(spacing: 0) {
                    ForEach(events) { event in
                        EventRow(event: event)
                        if event.id != events.last?.id {
                            Divider()
                                .padding(.leading, 20)
                        }
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(city.name)
    }
}

private struct EventRow: View {
    let event: Event

    private static let dateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .medium
        f.timeStyle = .none
        return f
    }()

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            VStack(spacing: 2) {
                Text(dayString)
                    .font(.title2.bold())
                Text(monthString)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .frame(width: 44)

            VStack(alignment: .leading, spacing: 4) {
                Text(event.title)
                    .font(.headline)
                Text(event.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
    }

    private var dayString: String {
        let cal = Calendar.current
        return String(cal.component(.day, from: event.date))
    }

    private var monthString: String {
        let f = DateFormatter()
        f.dateFormat = "MMM"
        return f.string(from: event.date).uppercased()
    }
}
