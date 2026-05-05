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
                AsyncImage(url: city.imageURL) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    case .empty:
                        Color.secondary.overlay(ProgressView())
                    default:
                        Color.secondary
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 280)
                .clipped()

                VStack(alignment: .leading, spacing: 8) {
                    Text(city.name)
                        .font(.largeTitle.bold())
                    Text("Canton \(city.canton)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(20)
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(city.name)
    }
}
