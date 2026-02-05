//
//  TrendingMoviesView.swift
//  CineNow
//
//  Created by NJ Development on 04/02/26.
//

import CineNowCore
import SwiftUI

struct TrendingMoviesView: View {
    @ObservedObject private var viewModel = TrendingMoviesViewModel()

    var body: some View {
        homeView
            .task {
                await viewModel.loadTrendingMovies()
            }
    }
}

private extension TrendingMoviesView {
    var homeView: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                if let randomMovie = viewModel.randomMovie {
                    HeaderView(movie: randomMovie)
                        .padding(12)
                }

                ForEach(viewModel.movies, id: \.id) { movie in
                    Text(movie.title ?? "N/A")
                        .onAppear {
                            if movie.id == viewModel.movies.last?.id {
                                Task {
                                    await viewModel.loadTrendingMovies()
                                }
                            }
                        }
                }

                if viewModel.state == .loading {
                    ProgressView()
                        .padding()
                }
            }
        }
    }
}

#Preview {
    TrendingMoviesView()
        .infinityFrame()
        .background(Color.appTheme.viewBackground)
}
