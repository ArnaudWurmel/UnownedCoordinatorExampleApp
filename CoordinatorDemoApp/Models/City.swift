//
//  City.swift
//  CoordinatorDemoApp
//
//  Created by Arnaud Wurmel on 05/05/2026.
//

import Foundation

struct City: Identifiable {
    let id = UUID()
    let name: String
    let canton: String
    let imageURL: URL
}

let cities: [City] = [
    City(
        name: "Geneva",
        canton: "GE",
        imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Geneve_2005_001_Ork.ch.jpg/1280px-Geneve_2005_001_Ork.ch.jpg")!
    ),
    City(
        name: "Lausanne",
        canton: "VD",
        imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Lausanne_-_panoramio_%281%29.jpg/1280px-Lausanne_-_panoramio_%281%29.jpg")!
    ),
    City(
        name: "Zurich",
        canton: "ZH",
        imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Altstadt_Z%C3%BCrich_2015.jpg/1280px-Altstadt_Z%C3%BCrich_2015.jpg")!
    ),
    City(
        name: "Bern",
        canton: "BE",
        imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/4/45/Bundeshaus_Bern_2009%2C_Flooffy.jpg")!
    ),
    City(
        name: "Basel",
        canton: "BS",
        imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Basel_-_M%C3%BCnsterpfalz1.jpg/1280px-Basel_-_M%C3%BCnsterpfalz1.jpg")!
    ),
    City(
        name: "Lucerne",
        canton: "LU",
        imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/2009_08_24_06262_Lucerne.jpg/1280px-2009_08_24_06262_Lucerne.jpg")!
    ),
    City(
        name: "St. Gallen",
        canton: "SG",
        imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/St.Gallen_vonDreiweieren_09.jpg/1280px-St.Gallen_vonDreiweieren_09.jpg")!
    ),
    City(
        name: "Lugano",
        canton: "TI",
        imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Lago_di_Lugano_at_Sunset_%28cropped_2%29.jpg/1280px-Lago_di_Lugano_at_Sunset_%28cropped_2%29.jpg")!
    ),
]
