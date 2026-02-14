//
//  HeaderView.swift
//  CineNow
//
//  Created by NJ Development on 05/02/26.
//

import Core
import SwiftUI

public struct HeaderView: View {
    public let movie: Movie

    public init(movie: Movie) {
        self.movie = movie
    }

    public var body: some View {
        Group {
            if let url = movie.posterURL {
                AsyncImage(url: url, transaction: Transaction(animation: .easeInOut(duration: 0.25))) { phase in
                    switch phase {
                    case .empty:
                        ZStack {
                            Color.gray.opacity(0.2)
                            ProgressView()
                        }
                        .transition(.opacity)
                        .scaledToFill()
                    case let .success(image):
                        image
                            .resizable()
                            .scaledToFill()
                            .transition(.opacity)
                    case .failure:
                        ZStack {
                            Color.gray.opacity(0.2)
                            Image(systemName: "photo")
                                .font(.largeTitle)
                                .foregroundStyle(.secondary)
                        }
                        .scaledToFill()
                    @unknown default:
                        ZStack {
                            Color.gray.opacity(0.2)
                            ProgressView()
                        }
                        .scaledToFill()
                    }
                }
            } else {
                ZStack {
                    Color.gray.opacity(0.2)
                    Image(systemName: "photo")
                        .font(.largeTitle)
                        .foregroundStyle(.secondary)
                }
                .scaledToFill()
            }
        }
        .frame(height: 440)
        .clipped()
        .cornerRadius(12)
    }
}

#Preview() {
    HeaderView(movie: .mock)
        .padding()
        .infinityFrame()
        .background(Color.appTheme.viewBackground)
}
