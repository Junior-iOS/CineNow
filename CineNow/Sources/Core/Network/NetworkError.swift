//
//  NetworkError.swift
//  Flix
//
//  Created by NJ Development on 22/01/26.
//

import Foundation

enum NetworkError: Error, LocalizedError {

    case invalidURL
    case invalidResponse
    case httpError(statusCode: Int)
    case decodingError(Error)
    case unknown(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "URL inválida."
        case .invalidResponse:
            return "Resposta inválida do servidor."
        case .httpError(let statusCode):
            return "Erro HTTP: \(statusCode)."
        case .decodingError:
            return "Erro ao decodificar a resposta."
        case .unknown:
            return "Erro desconhecido."
        }
    }
}
