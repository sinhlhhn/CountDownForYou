//
//  EventsViewModel.swift
//  CountDownForYou
//
//  Created by Sam on 05/09/2024.
//

import Foundation

class EventsViewModel: ObservableObject {
    @Published var events: [EventModel] = []
    
    func loadEvents() {
        events = []
        for event in UserDefaultUtil.loadEvents().values {
            events.append(event)
        }
    }
    
    func delete(_ event: EventModel) {
        UserDefaultUtil.delete(event)
        events.removeAll { $0 == event }
    }
    
    func saveEvent(_ event: EventModel) {
        _ = UserDefaultUtil.save(event)
    }
}
