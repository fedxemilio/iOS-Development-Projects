//
//  SwiftUITextLabApp.swift
//  SwiftUITextLab
//
//  Created by Jane Madsen on 9/10/25.
//

import SwiftUI

@main
struct SwiftUITextLabApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                        .accentColor(.purple)
                        .toolbarBackground(Color.blue, for: .tabBar)
                        .toolbarBackground(.visible, for: .tabBar)
                }
            TopFiveFriendsView()
                .tabItem {
                    Label("Friends", systemImage: "person.3.sequence")
                        .toolbarBackground(Color.red, for: .tabBar)
                        .toolbarBackground(.visible, for: .tabBar)
                }
            BlogPostView()
                .tabItem {
                    Label("Blog", systemImage: "doc.text")
                        .toolbarBackground(Color.green, for: .tabBar)
                        .toolbarBackground(.visible, for: .tabBar)
                }
        }
    }
}
