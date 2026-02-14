//
//  TrendingMoviesViewModel.swift
//  CineNow
//
//  Created by NJ Development on 05/02/26.
//

import Combine
import Core
import Foundation

@MainActor
final class TrendingMoviesViewModel: ObservableObject {
    // MARK: - Published State

    @Published var movies: [Movie] = []
    @Published var randomMovie: Movie?
    @Published private(set) var state: ViewState<[Movie]> = .idle

    // MARK: - Pagination

    private var currentPage: Int = 1
    private var totalPages: Int = 1
    private let prefetchThreshold: Int = 5

    // MARK: - Dependencies

    private let apiClient: APIClientProcotol

    // MARK: - Init

    init(apiClient: APIClientProcotol = APIClient()) {
        self.apiClient = apiClient
    }

    func loadMoreIfNeeded(currentMovie movie: Movie) async {
        guard movie.id == movies.last?.id else { return }
        await loadTrendingMovies()
    }

    func loadTrendingMovies() async {
        guard currentPage <= totalPages else { return }
        state = .loading

        do {
            let endpoint = Endpoint(.trendingMovies, page: currentPage)
            let response: MovieResponse = try await apiClient.request(endpoint)

            if movies.isEmpty {
                randomMovie = response.results.randomElement()
            }

            totalPages = response.totalPages ?? currentPage
            currentPage += 1

            let newMovies = response.results.filter { newMovie in
                !movies.contains(where: { $0.id == newMovie.id })
            }

            movies.append(contentsOf: newMovies)
            state = .loaded(movies)

        } catch {
            state = .error(error.localizedDescription)
            print("❌ TrendingViewModel error:", error)
        }
    }
}
