//
//  APIClient.swift
//  Flix
//
//  Created by NJ Development on 22/01/26.
//

import Foundation

public protocol APIClientProtocol: Sendable {
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T
}

public final class APIClient: APIClientProtocol {
    private let session: URLSession
    private let decoder: JSONDecoder
    
    public init(
        session: URLSession = .shared,
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.session = session
        self.decoder = decoder
    }

    public func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        let request = try endpoint.asURLRequest()
        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        switch httpResponse.statusCode {
        case 200...299:
            do {
                return try decoder.decode(T.self, from: data)
            } catch let error {
              throw NetworkError.decodingError(error)
            }

        case 401:
          throw NetworkError.httpError(statusCode: 401)

        default:
            throw NetworkError.invalidResponse
        }
    }
}
