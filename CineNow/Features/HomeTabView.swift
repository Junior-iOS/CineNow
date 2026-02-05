//
//  HomeTabView.swift
//  CineNow
//
//  Created by NJ Development on 04/02/26.
//

import Combine
import Foundation
import SwiftUI

enum Tab: Hashable {
    case home
    case upcoming
    case popular
    case settings
}

struct HomeTabView: View {
    @State private var selection: Tab = .home

    var body: some View {
        TabView(selection: $selection) {
            homeView
            upcomingView
            popularView
            settingsView
        }
        .tint(.appTheme.accent)
    }
}

private extension HomeTabView {
    var homeView: some View {
        NavigationStack {
            HomeView()
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
        }
        .tabItem {
            Image(icon: selection == .home ? .playHouseFill : .house)
            Text("Home")
        }
        .tag(Tab.home)
    }

    var upcomingView: some View {
        UpcomingMoviesView()
            .tabItem {
                Image(icon: selection == .upcoming ? .calendarBadgeCheckmark : .calendar)
                Text("Upcoming")
            }
            .tag(Tab.upcoming)
    }

    var popularView: some View {
        PopularMoviesView()
            .tabItem {
                Image(icon: selection == .popular ? .popcornCircle : .popcorn)
                Text("Popular")
            }
            .tag(Tab.popular)
    }

    var settingsView: some View {
        SettingsView()
            .tabItem {
                Image(icon: selection == .settings ? .gearBadgeCheckmark : .gear)
                Text("Settings")
            }
            .tag(Tab.settings)
    }
}

#Preview("Light mode") {
    HomeTabView()
        .preferredColorScheme(.light)
}

#Preview("Dark mode") {
    HomeTabView()
        .preferredColorScheme(.dark)
}
