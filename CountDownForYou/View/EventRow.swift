//
//  EventRow.swift
//  CountDownForYou
//
//  Created by Sam on 29/08/2024.
//

import SwiftUI

struct EventRow: View {
    let model: EventModel
    @State private var relativeDate: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(model.title)
                .foregroundStyle(model.color)
            Text(relativeDate)
        }
        .onAppear {
            startTimer()
        }
    }
    
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            relativeDate = model.date.getRelativeDate()
        }).fire()
    }
}

extension Date {
    func getRelativeDate(to date: Date = Date.now) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full

        let relativeDate = formatter.localizedString(for: self, relativeTo: date)
        
        return relativeDate
    }
}

#Preview {
    EventRow(model: EventModel.all().first!)
}
