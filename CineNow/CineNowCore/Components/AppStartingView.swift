//
//  AppStartingView.swift
//  CineNow
//
//  Created by NJ Development on 04/02/26.
//

import SwiftUI

struct AppStartingView: View {
    @StateObject private var viewModel = AppStartingViewModel()
    
    var body: some View {
        Group {
            if !viewModel.shouldShowLoginView {
                LoginView(shouldShowLoginView: $viewModel.shouldShowLoginView)
            } else {
                HomeTabView()
            }
        }
        .animation(.easeIn, value: viewModel.shouldShowLoginView)
    }
}

#Preview {
    AppStartingView()
}
