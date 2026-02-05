//
//  AppStartingViewModel.swift
//  CineNow
//
//  Created by NJ Development on 04/02/26.
//

import Combine
import Foundation

@MainActor
final class AppStartingViewModel: ObservableObject {
    @Published var shouldShowLoginView: Bool = true
}
