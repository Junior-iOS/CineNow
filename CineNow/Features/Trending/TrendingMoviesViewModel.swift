//
//  TrendingMoviesViewModel.swift
//  CineNow
//
//  Created by NJ Development on 05/02/26.
//

import CineNowCore
import Combine
import Foundation
import Networking

@MainActor
final class TrendingMoviesViewModel: ObservableObject {
    // MARK: - Published State

    @Published var movies: [Movie] = []
    @Published var randomMovie: Movie?
    @Published var state: ViewState = .idle

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

    func loadTrendingMovies() async {
        // 🔒 Evita múltiplas chamadas simultâneas
        guard state != .loading else { return }

        // 🧱 Evita chamar após a última página
        guard currentPage <= totalPages else { return }
        state = .loading

        do {
            let endpoint = Endpoint(.trendingMovies, page: currentPage)
            let response: MovieResponse = try await apiClient.request(endpoint)

            // 🎲 Header random só na primeira carga
            if movies.isEmpty {
                randomMovie = response.results.randomElement()
            }

            // 📄 Atualiza paginação
            totalPages = response.totalPages ?? currentPage
            currentPage += 1

            // 🚫 Remove duplicados (blindagem extra)
            let newMovies = response.results.filter { newMovie in
                !movies.contains(where: { $0.id == newMovie.id })
            }

            movies.append(contentsOf: newMovies)
            state = .loaded

        } catch {
            state = .error(error.localizedDescription)
            print("❌ TrendingViewModel error:", error)
        }
    }
}
