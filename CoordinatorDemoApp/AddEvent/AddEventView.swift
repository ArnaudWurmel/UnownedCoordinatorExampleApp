//
//  AddEventView.swift
//  CoordinatorDemoApp
//
//  Created by Arnaud Wurmel on 05/05/2026.
//

import SwiftUI

protocol AddEventNavigationDelegate: AnyObject {
    func addEvent(didSave event: Event)
    func addEventDidCancel()
}

struct AddEventView: View {
    weak var navigationDelegate: AddEventNavigationDelegate?

    @State private var title = ""
    @State private var subtitle = ""
    @State private var date = Date()

    var body: some View {
        Form {
            Section("Details") {
                TextField("Title", text: $title)
                TextField("Description", text: $subtitle)
            }
            Section("Date") {
                DatePicker("Date", selection: $date, displayedComponents: .date)
                    .datePickerStyle(.graphical)
            }
        }
        .navigationTitle("New Event")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") { navigationDelegate?.addEventDidCancel() }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    let event = Event(title: title, subtitle: subtitle, date: date)
                    navigationDelegate?.addEvent(didSave: event)
                }
                .disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)
            }
        }
    }
}
