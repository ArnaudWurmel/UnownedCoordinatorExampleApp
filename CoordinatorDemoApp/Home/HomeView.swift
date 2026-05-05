//
//  HomeView.swift
//  CoordinatorDemoApp
//
//  Created by Arnaud Wurmel on 05/05/2026.
//

import SwiftUI

protocol HomeNavigationDelegate: AnyObject {
    func home(didSelect city: City)
}

private let columns = [
    GridItem(.flexible()),
    GridItem(.flexible()),
]

struct HomeView: View {
    weak var navigationDelegate: HomeNavigationDelegate?

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(cities) { city in
                    Button { navigationDelegate?.home(didSelect: city) } label: {
                        CityTile(city: city)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(16)
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle("Home")
    }
}

private struct CityTile: View {
    let city: City

    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color.secondary.opacity(0.2))
            .frame(height: 120)
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
                .overlay {
                    Color.black
                        .opacity(0.4)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(alignment: .bottomLeading) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(city.name)
                        .font(.headline)
                        .foregroundStyle(.white)
                    Text(city.canton)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.85))
                }
                .padding(10)
            }
    }
}
