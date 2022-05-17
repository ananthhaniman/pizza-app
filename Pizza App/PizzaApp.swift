//
//  Pizza_AppApp.swift
//  Pizza App
//
//  Created by Ananthamoorthy Haniman on 2022-05-17.
//

import SwiftUI

@main
struct PizzaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
