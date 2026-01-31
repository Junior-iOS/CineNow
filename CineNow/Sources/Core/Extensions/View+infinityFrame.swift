//
//  View+infinityFrame.swift
//  Flix
//
//  Created by NJ Development on 23/01/26.
//

import SwiftUI

extension View {
    public func infinityFrame() -> some View {
        self.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
