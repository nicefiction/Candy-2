//
//  Candy_2App.swift
//  Candy 2
//
//  Created by Olivier Van hamme on 02/08/2021.
//

import SwiftUI

@main
struct Candy_2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
