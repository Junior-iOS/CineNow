//
//  Movie.swift
//  Flix
//
//  Created by NJ Development on 22/01/26.
//

import Foundation

public struct MovieResponse: Codable {
    public let page: Int
    public let results: [Movie]
    public let totalPages: Int?
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
    }
}

public struct Movie: Codable, Identifiable, Sendable {
    public let id: Int
    public let mediaType: String?
    public let title: String?
    public let posterPath: String?
    public let overview: String?
    public let releaseDate: String?
    public let voteAverage: Double?
    
    public var posterURL: URL? {
        guard let path = posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500" + path)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case mediaType = "media_type"
        case title
        case posterPath = "poster_path"
        case overview
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}

// MARK: - Preview Mock Data
extension Movie {
    public static let mock = Movie(
        id: 1168190,
        mediaType: "movie",
        title: "The Wrecking Crew",
        posterPath: "/gbVwHl4YPSq6BcC92TQpe7qUTh6.jpg",
        overview: "Estranged half-brothers Jonny and James reunite after their father's mysterious death.",
        releaseDate: "2026-01-28",
        voteAverage: 6.304,
    )
}
