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
}

public struct Movie: Codable, Identifiable, Sendable, Equatable {
    public let id: Int
    public let mediaType: String?
    public let title: String?
    public let posterPath: String?
    public let overview: String?
    public let releaseDate: String?
    public let voteAverage: Double?

    public init(
        id: Int,
        mediaType: String?,
        title: String?,
        posterPath: String?,
        overview: String?,
        releaseDate: String?,
        voteAverage: Double?
    ) {
        self.id = id
        self.mediaType = mediaType
        self.title = title
        self.posterPath = posterPath
        self.overview = overview
        self.releaseDate = releaseDate
        self.voteAverage = voteAverage
    }

    public var posterURL: URL? {
        guard let path = posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500" + path)
    }
}
