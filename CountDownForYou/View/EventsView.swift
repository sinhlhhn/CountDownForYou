//
//  EventsView.swift
//  CountDownForYou
//
//  Created by Sam on 29/08/2024.
//

import SwiftUI

struct EventsView: View {
    
    @StateObject var viewModel: EventsViewModel
    @State var isActiveEventForm = false
    
    var body: some View {
        NavigationStack {
            List(viewModel.events.sorted()) { event in
                NavigationLink(value: event, label: {
                    EventRow(model: event)
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                viewModel.delete(event)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                })
            }
            .navigationDestination(for: EventModel.self) { event in
                createEventForm(mode: .edit(event))
            }
            .toolbar(content: {
                Button(action: {}, label: {
                    NavigationLink(destination: createEventForm(mode: .add)) {
                        Image(systemName: "plus")
                    }
                })
            })
            .onAppear {
                viewModel.loadEvents()
            }
            .navigationTitle("List Events")
            .toolbarTitleDisplayMode(.inline)
        }
        
    }
    
    private func createEventForm(mode: Mode) -> some View {
        EventForm(
            viewModel: EventViewModel(mode: mode), onSave: { event in
                viewModel.saveEvent(event)
            }
        )
    }
}
