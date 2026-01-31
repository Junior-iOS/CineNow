import Foundation
import Core

@MainActor
final class HomeViewModel: ObservableObject {

    // MARK: - Published State
    @Published private(set) var movies: [Movie] = []
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorMessage: String?
    @Published private(set) var featuredMovie: Movie?

    // MARK: - Pagination
    private var currentPage: Int = 1
    private var totalPages: Int = 1
    private let prefetchThreshold: Int = 5

    // MARK: - Dependencies
    private let apiClient: APIClientProtocol

    // MARK: - Init
    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }

    // MARK: - Public API

    func loadTrendingMoviesIfNeeded(currentItem: Movie?) async {
        guard !isLoading, currentPage <= totalPages else { return }

        if let currentItem {
            guard shouldLoadNextPage(currentItem: currentItem) else { return }
        }

        await loadTrendingMovies()
    }

    func refresh() async {
        resetPagination()
        await loadTrendingMovies()
    }

    // MARK: - Private

    private func loadTrendingMovies() async {
        isLoading = true

        do {
            let endpoint = Endpoint(
                movieType: .trendingMovies,
                page: currentPage
            )

            let response: MovieResponse = try await apiClient.request(endpoint)

            if movies.isEmpty {
                featuredMovie = response.results.randomElement()
            }

            currentPage = response.page + 1
            totalPages = response.totalPages ?? Int.max
            movies.append(contentsOf: response.results)

        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }

    private func shouldLoadNextPage(currentItem: Movie) -> Bool {
        guard let index = movies.firstIndex(where: { $0.id == currentItem.id }) else {
            return false
        }

        let thresholdIndex = movies.index(movies.endIndex, offsetBy: -prefetchThreshold)
        return index >= thresholdIndex
    }

    private func resetPagination() {
        movies = []
        currentPage = 1
        totalPages = 1
    }
}
