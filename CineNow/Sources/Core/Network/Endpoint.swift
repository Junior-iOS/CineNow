//
//  Endpoint.swift
//  Flix
//
//  Created by NJ Development on 22/01/26.
//

import Foundation

public enum MovieType {
    case trendingMovies
    case upcoming
    case popular
}

public struct Endpoint {
    let movieType: MovieType
    let page: Int
    
    public init(movieType: MovieType, page: Int = 1) {
        self.movieType = movieType
        self.page = page
    }
    
    private var baseURL: String {
        "https://api.themoviedb.org/3"
    }

    private var apiKey: String {
        Secrets.tmdbApiKey
    }

    private var path: String {
        switch movieType {
        case .trendingMovies:
            return "/trending/movie/day"
        case .upcoming:
            return "/movie/upcoming"
        case .popular:
            return "/movie/popular"
        }
    }

    private var method: String {
        "GET"
    }

    private var queryItems: [URLQueryItem] {
        [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "page", value: String(page))
        ]
    }

    public func asURLRequest() throws -> URLRequest {
        guard var components = URLComponents(string: baseURL + path) else {
            throw NetworkError.invalidURL
        }

        components.queryItems = queryItems

        guard let url = components.url else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method
        request.timeoutInterval = 30
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        return request
    }
}

