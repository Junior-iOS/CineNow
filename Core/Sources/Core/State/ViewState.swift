//
//  ViewState.swift
//  CineNow
//
//  Created by NJ Development on 05/02/26.
//

import Foundation

public enum ViewState<T: Equatable>: Equatable {
    case idle
    case loading
    case loaded(T)
    case error(String)
}
