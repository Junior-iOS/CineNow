//
//  View+infinityFrame.swift
//  CineNow
//
//  Created by NJ Development on 04/02/26.
//

import SwiftUI

extension View {
    public func infinityFrame() -> some View {
        self.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
