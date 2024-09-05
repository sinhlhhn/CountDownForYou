//
//  UserDefaultUtil.swift
//  CountDownForYou
//
//  Created by Sam on 05/09/2024.
//

import Foundation

final class UserDefaultUtil {
    private init() {}
    static let userDefault = UserDefaults.standard
    
    enum Constants {
        static let events = "events"
    }
    
    static func save(_ event: EventModel) -> Bool {
        guard let data = userDefault.value(forKey: Constants.events) as? Data else {
            print("List event is empty")
            return false
        }
        guard var currentEvents = try? JSONDecoder().decode([String: EventModel].self, from: data) else {
            print("Failed to decode")
            return false
        }
        
        currentEvents[event.title] = event
        
        do {
            let encodeData = try JSONEncoder().encode(currentEvents)
            userDefault.set(encodeData, forKey: Constants.events)
            return true
        } catch {
            print("Failed to encode and save the dictionary: \(error)")
            return false
        }
    }
    
    static func loadEvents() -> [String: EventModel] {
        let userDefault = UserDefaults.standard
        guard let data = userDefault.value(forKey: Constants.events) as? Data else {
            print("List event is empty")
            return [:]
        }
        guard let currentEvents = try? JSONDecoder().decode([String: EventModel].self, from: data) else {
            print("Failed to decode")
            return [:]
        }
        
        return currentEvents
    }
    
    static func delete(_ event: EventModel) {
        var currentEvents = loadEvents()
        currentEvents.removeValue(forKey: event.title)
        
        do {
            let encodeData = try JSONEncoder().encode(currentEvents)
            UserDefaults.standard.set(encodeData, forKey: Constants.events)
        } catch {
            print("Failed to encode and save the dictionary: \(error)")
        }
    }
}
