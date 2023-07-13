//
//  TabbarContentView.swift
//  RickAndMorthyApp
//
//  Created by Miguel Saravia on 10/7/23.
//

import SwiftUI
import UIKit

struct TabbarContentView: View {
    @State var activeTab: SeletedTab = SeletedTab.characters
    
    init() {
        tabBarAppearance()
    }
    
    var body: some View {
        TabView(selection: $activeTab) {
            
            CharacterView(presenter: CharacterPresenter())
                .tabItem {
                    Image(systemName: "person.2")
                    Text("Characters")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                }
                .tag(SeletedTab.characters)
            
            EpisodeView()
                .tabItem {
                    Image(systemName: "tv")
                    Text("Episode")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                }
                .tag(SeletedTab.episodes)
            
            LocationView()
                .tabItem {
                    Image(systemName: "location")
                    Text("Location")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                }
                .tag(SeletedTab.locations)
        }
        .navigationBarTitle(tabbarTitle(for: activeTab), displayMode: .large)
        .accentColor(.white)
    }
}

extension TabbarContentView {
    
    func tabBarAppearance() {
        UITabBar.appearance().barTintColor = UIColor().hexColor(hex: "#4D695C")
        UITabBar.appearance().backgroundColor = UIColor().hexColor(hex: "#4D695C")
//        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().unselectedItemTintColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    func tabbarTitle(for tabItem: SeletedTab) -> String {
        switch tabItem {
        case .characters:
            return "Characters"
        case .locations:
            return "Locations"
        case .episodes:
            return "Episodes"
        }
    }
}

struct TabbarContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarContentView()
    }
}

extension UINavigationController {
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }
}

extension UITabBarController {
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        tabBar.standardAppearance = appearance
    }
}

