//
//  ToastModifier.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Bibhu Basnet on 12/4/24.
//

import SwiftUI

struct ToastModifier: ViewModifier {
    @Binding var isShowing: Bool
    let text: Text

    func body(content: Content) -> some View {
        ZStack {
            content
            if isShowing {
                VStack {
                    Spacer()
                    text
                        .padding()
                        .background(Color.black.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding()
                        .transition(.opacity)
                        .animation(.easeInOut, value: isShowing)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            isShowing = false
                        }
                    }
                }
            }
        }
    }
}

extension View {
    func toast(isShowing: Binding<Bool>, text: Text) -> some View {
        self.modifier(ToastModifier(isShowing: isShowing, text: text))
    }
}
