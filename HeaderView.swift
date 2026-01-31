//
//  HeaderView.swift
//  CineNow
//
//  Created by NJ Development on 30/01/26.
//

import SwiftUI
import Core

struct HeaderView: View {
    let movie: Movie
    
    var body: some View {
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
                    case .success(let image):
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
        .frame(maxWidth: .infinity, minHeight: 440)
        .background(Color.clear)
        .contentShape(Rectangle())
    }
}

#Preview {
    HeaderView(movie: Movie.mock)
}
