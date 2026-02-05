//
//  LoginView.swift
//  CineNow
//
//  Created by NJ Development on 04/02/26.
//

import SwiftUI
import Combine

struct LoginView: View {
    @Binding var shouldShowLoginView: Bool
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        Text("LoginView")
    }
}

#Preview {
    LoginView(shouldShowLoginView: .constant(false))
}
