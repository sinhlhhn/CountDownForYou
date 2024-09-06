//
//  EventViewModel.swift
//  CountDownForYou
//
//  Created by Sam on 05/09/2024.
//

import SwiftUI

enum Mode {
    case add
    case edit(EventModel)
}

class EventViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var date: Date = Date()
    @Published var color: Color = .red
    @Published var errorMessage: String = ""
    
    var navTitle: String
    
    var isSaveButtonDisabled: Bool {
        title.isEmpty
    }
    
    init(mode: Mode) {
        switch mode {
        case .add:
            navTitle = "Add Event"
        case .edit(let event):
            navTitle = "Edit \(event.title)"
            title = event.title
            date = event.date
            color = event.color
        }
    }
    
    func getEventModel() -> EventModel {
        EventModel(title: title, date: date, color: color)
    }
}
