//
//  ViewState.swift
//  CineNow
//
//  Created by NJ Development on 05/02/26.
//

import Foundation

public enum ViewState: Equatable {
    case idle
    case loading
    case loaded
    case error(String)
}
