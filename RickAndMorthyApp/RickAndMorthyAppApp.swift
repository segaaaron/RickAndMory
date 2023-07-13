//
//  RickAndMorthyAppApp.swift
//  RickAndMorthyApp
//
//  Created by Miguel Saravia on 8/7/23.
//

import SwiftUI

@main
struct RickAndMorthyAppApp: App {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.red]
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TabbarContentView()
            }
            .accentColor(Color(.red))
        }
    }
}
