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

let events: [Event] = [
    Event(
        title: "Jazz Festival",
        subtitle: "Open-air concerts at the lakeside",
        date: date(year: 2026, month: 7, day: 4)
    ),
    Event(
        title: "Food & Wine Market",
        subtitle: "Local producers and regional specialties",
        date: date(year: 2026, month: 7, day: 18)
    ),
    Event(
        title: "Summer Cinema",
        subtitle: "Outdoor screenings under the stars",
        date: date(year: 2026, month: 8, day: 1)
    ),
    Event(
        title: "Mountain Trail Run",
        subtitle: "10 km and 21 km courses",
        date: date(year: 2026, month: 8, day: 22)
    ),
    Event(
        title: "Autumn Craft Fair",
        subtitle: "Handmade goods from local artisans",
        date: date(year: 2026, month: 9, day: 12)
    ),
]

private func date(year: Int, month: Int, day: Int) -> Date {
    Calendar.current.date(from: DateComponents(year: year, month: month, day: day))!
}
