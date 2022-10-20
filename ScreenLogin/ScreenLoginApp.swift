//
//  ScreenLoginApp.swift
//  ScreenLogin
//
//  Created by zoya me on 10/20/22.
//

import SwiftUI
import Firebase

@main
struct ScreenFirebaseApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
