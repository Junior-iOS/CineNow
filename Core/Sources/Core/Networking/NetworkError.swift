//
//  NetworkError.swift
//  CineNow
//
//  Created by NJ Development on 05/02/26.
//

import Foundation

public enum NetworkError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case httpError(statusCode: Int)
    case decodingError(Error)
    case unknown(Error)

    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            "URL inválida."
        case .invalidResponse:
            "Resposta inválida do servidor."
        case let .httpError(statusCode):
            "Erro HTTP: \(statusCode)."
        case .decodingError:
            "Erro ao decodificar a resposta."
        case .unknown:
            "Erro desconhecido."
        }
    }
}
