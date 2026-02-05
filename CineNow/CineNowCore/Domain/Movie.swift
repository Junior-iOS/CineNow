//
//  Movie.swift
//  CineNow
//
//  Created by NJ Development on 05/02/26.
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

public struct Movie: Codable, Identifiable, Sendable, Equatable {
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
