//
//  Roadtrips_App_VIPERApp.swift
//  Roadtrips-App-VIPER
//
//  Created by Somnath Mandhare on 01/11/23.
//

import SwiftUI

@main
struct Roadtrips_App_VIPERApp: App {
    let model = DataModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
                .onAppear {
                    model.load()
                }
        }
    }
}
