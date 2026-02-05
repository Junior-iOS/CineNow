//
//  View+infinityFrame.swift
//  CineNow
//
//  Created by NJ Development on 04/02/26.
//

import SwiftUI

public extension View {
    func infinityFrame() -> some View {
        self.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
