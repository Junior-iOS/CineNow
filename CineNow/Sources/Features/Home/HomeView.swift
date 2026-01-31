//
//  HomeView.swift
//  CineNow
//
//  Created by NJ Development on 26/01/26.
//

import SwiftUI
import Core

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        homeView
            .task {
                await viewModel.loadTrendingMoviesIfNeeded(currentItem: nil)
            }
    }
}

private extension HomeView {
    var homeView: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 12) {
                if let featuredMovie = viewModel.featuredMovie {
                    HeaderView(movie: featuredMovie)
                        .padding(12)
                }

                ForEach(viewModel.movies) { movie in
                    Text(movie.title ?? "N/A")
                        .padding(.vertical, 4)
                        .onAppear {
                            Task {
                                await viewModel.loadTrendingMoviesIfNeeded(currentItem: movie)
                            }
                        }
                }

                if viewModel.isLoading {
                    ProgressView()
                        .padding()
                }
            }
        }
    }
}

#Preview {
    HomeView()
        .infinityFrame()
//        .background(Color.appTheme.viewBackground)
}
