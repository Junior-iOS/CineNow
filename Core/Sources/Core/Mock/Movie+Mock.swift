//
//  Movie+Mock.swift
//  CineNow
//
//  Created by NJ Development on 05/02/26.
//

#if DEBUG
import Foundation

public extension Movie {
    static let mock = Movie(
        id: 1,
        mediaType: nil,
        title: "Mortal Kombat",
        posterPath: "/xGuOF1T3WmPsAcQEQJfnG7Ud9f8.jpg",
        overview: "Explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
        releaseDate: "2014-11-07",
        voteAverage: 8.6
    )
}
#endif
