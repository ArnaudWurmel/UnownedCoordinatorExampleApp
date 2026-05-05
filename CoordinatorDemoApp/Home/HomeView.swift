//
//  HomeView.swift
//  CoordinatorDemoApp
//
//  Created by Arnaud Wurmel on 05/05/2026.
//

import SwiftUI

protocol HomeNavigationDelegate: AnyObject {
    // implement delegate methods
}

private struct City: Identifiable {
    let id = UUID()
    let name: String
    let canton: String
    let color: Color
}

private let cities: [City] = [
    City(name: "Geneva", canton: "GE", color: .blue),
    City(name: "Lausanne", canton: "VD", color: .purple),
    City(name: "Zurich", canton: "ZH", color: .indigo),
    City(name: "Bern", canton: "BE", color: .orange),
    City(name: "Basel", canton: "BS", color: .red),
    City(name: "Lucerne", canton: "LU", color: .teal),
    City(name: "St. Gallen", canton: "SG", color: .green),
    City(name: "Lugano", canton: "TI", color: .yellow),
]

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
                    CityTile(city: city)
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
            .fill(city.color.gradient)
            .frame(height: 120)
            .overlay(
                VStack(alignment: .leading, spacing: 4) {
                    Text(city.name)
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    Text(city.canton)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.8))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                .padding(12)
            )
    }
}
