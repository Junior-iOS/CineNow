//
//  View+Colors.swift
//  CineNow
//
//  Created by NJ Development on 04/02/26.
//

import Foundation
import SwiftUI

extension Color {
    static var appTheme = main
}

extension Color {
    static var main: AppColorTheme {
        .init(
            accent: .init(.accent),
            alternateAccent: .init(.alternateAccent),
            viewBackground: .init(.viewBackground),
            cellBackground: .init(.cellBackground),
            text: .init(.text),
            secondaryText: .init(.secondaryText),
            alternateText: .init(.alternateText),
            accentContrastText: .init(.accentContrastText),
            primaryAction: .init(.primaryAction),
            neutralAction: .init(.neutralAction),
            destructive: .init(.destructive),
            success: .init(.success),
            warning: .init(.warning),
            info: .init(.info),
            inProgress: .init(.inProgress),
            divider: .init(.divider),
            miscellaneous: .init(.miscellaneous)
        )
    }
}

struct AppColorTheme {
    let accent: Color
    let alternateAccent: Color
    let viewBackground: Color
    let cellBackground: Color
    let text: Color
    let secondaryText: Color
    let alternateText: Color
    let accentContrastText: Color
    let primaryAction: Color
    let neutralAction: Color
    let destructive: Color
    let success: Color
    let warning: Color
    let info: Color
    let inProgress: Color
    let divider: Color
    let miscellaneous: Color
}

#Preview("Light mode") {
    Preview()
        .preferredColorScheme(.light)
}

#Preview("Dark mode") {
    Preview()
        .preferredColorScheme(.dark)
}

fileprivate struct Preview: View {
    var body: some View {
        VStack {
            VStack {
                Text("Title")
                    .foregroundColor(.appTheme.text)
                Text("Subtitle")
                    .foregroundColor(.appTheme.secondaryText)
            }
            
            Divider()
                .foregroundColor(.appTheme.divider)
            
            Button { } label: {
                Text("Get started")
                    .padding()
                    .background(Color.appTheme.accent)
                    .cornerRadius(8)
                    .foregroundColor(.appTheme.accentContrastText)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.appTheme.viewBackground)
    }
}
