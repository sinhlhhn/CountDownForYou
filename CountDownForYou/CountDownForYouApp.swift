//
//  CountDownForYouApp.swift
//  CountDownForYou
//
//  Created by Sam on 29/08/2024.
//

import SwiftUI

@main
struct CountDownForYouApp: App {
    var body: some Scene {
        WindowGroup {
            EventsView(viewModel: EventsViewModel())
        }
    }
}
