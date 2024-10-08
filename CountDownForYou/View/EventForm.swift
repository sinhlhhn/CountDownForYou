//
//  EventForm.swift
//  CountDownForYou
//
//  Created by Sam on 03/09/2024.
//

import SwiftUI

struct EventForm: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: EventViewModel
    
    private var onSave: (EventModel) -> Void
    
    init(viewModel: EventViewModel, onSave: @escaping (EventModel) -> Void) {
        self.onSave = onSave
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("Title", text: $viewModel.title, prompt: Text("Title"))
                        .foregroundStyle(viewModel.color)
                    DatePicker(selection: $viewModel.date) {
                        Text("Date")
                    }
                    ColorPicker(selection: $viewModel.color, label: {
                        Text("Color")
                    })
                }
            }
            Text(viewModel.errorMessage)
                .foregroundStyle(.red)
        }
        .toolbar(content: {
            Button(action: {
                onSave(viewModel.getEventModel())
                dismiss()
            }, label: {
                Text("Save")
            })
            .disabled(viewModel.isSaveButtonDisabled)
        })
        .navigationTitle(viewModel.navTitle)
        .toolbarTitleDisplayMode(.inline)
    }
}
