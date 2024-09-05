//
//  EventModel.swift
//  CountDownForYou
//
//  Created by Sam on 29/08/2024.
//

import Foundation
import SwiftUI

struct EventModel: Identifiable, Comparable, Hashable, Codable {
    let id: UUID
    let title: String
    let date: Date
    private let colorData: ColorData
    
    var color: Color {
        colorData.toColor()
    }
    
    static func < (lhs: EventModel, rhs: EventModel) -> Bool {
        return lhs.date < rhs.date
    }
    
    struct ColorData: Codable, Hashable {
        var red: Double
        var green: Double
        var blue: Double
        var opacity: Double
        
        init(color: Color) {
            let components = UIColor(color).cgColor.components!
            self.red = Double(components[0])
            self.green = Double(components[1])
            self.blue = Double(components[2])
            self.opacity = Double(components[3])
        }
        
        func toColor() -> Color {
            return Color(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
        }
    }
    
    init(id: UUID = UUID(), title: String, date: Date, color: Color) {
        self.id = id
        self.title = title
        self.date = date
        self.colorData = ColorData(color: color)
    }
    
    static func all() -> [EventModel] {
        [
            EventModel(title: "Birthday Party", date: Date().addingTimeInterval(60*60*24), color: .red),
            EventModel(title: "Conference Call", date: Date().addingTimeInterval(60*60*24*2), color: .blue),
            EventModel(title: "Lunch with Friend", date: Date().addingTimeInterval(60*60*24*1), color: .green),
            EventModel(title: "Project Deadline", date: Date().addingTimeInterval(60*60*24*10), color: .orange),
            EventModel(title: "Doctor's Appointment", date: Date().addingTimeInterval(60*60*24*3), color: .purple),
            EventModel(title: "Work Meeting", date: Date().addingTimeInterval(60*60*24*7), color: .yellow),
            EventModel(title: "Wedding", date: Date().addingTimeInterval(60*60*24*20), color: .pink),
            EventModel(title: "Grocery Shopping", date: Date().addingTimeInterval(60*60*24*4), color: .gray),
            EventModel(title: "Vacation Starts", date: Date().addingTimeInterval(60*60*24*15), color: .teal),
            EventModel(title: "Family Dinner", date: Date().addingTimeInterval(60*60*24*6), color: .brown)
        ]
    }
}

