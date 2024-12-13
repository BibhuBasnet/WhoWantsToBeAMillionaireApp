//
//  WinningScreen.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Bibhu Basnet on 12/4/24.
//
import SwiftUI

struct WinningScreen: View {
    var winnings: Int

    @State private var scaleEffect: CGFloat = 1.0
    @State private var opacity: Double = 0.0
    @State private var showConfetti = false

    var body: some View {
        ZStack {
            // Gradient Background
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.orange]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.8) // Make the gradient slightly transparent

            // Confetti Animation (Mocked)
            if showConfetti {
                ConfettiView() // Custom view for confetti animation
                    .edgesIgnoringSafeArea(.all)
            }

            VStack {
                Spacer()

                // Congratulations Text with animations
                Text("Congratulations!")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 10, x: 0, y: 10)
                    .padding()
                    .scaleEffect(scaleEffect) // Animated scaling
                    .onAppear {
                        withAnimation(.easeIn(duration: 0.8).repeatForever(autoreverses: true)) {
                            scaleEffect = 1.2 // Scaling effect
                        }
                    }

                // Winning Amount Text with glowing effect and larger font
                Text("You have won $\(winnings.formatted())")
                    .font(.system(size: 45, weight: .bold, design: .rounded))
                    .foregroundColor(.green)
                    .multilineTextAlignment(.center)
                    .shadow(color: .black, radius: 10, x: 0, y: 10)
                    .padding(.bottom, 50)
                    .opacity(opacity) // Fade-in effect
                    .onAppear {
                        withAnimation(.easeIn(duration: 2)) {
                            opacity = 1.0 // Fade in the text
                        }
                    }

                // Play Again Button with additional styling
                NavigationLink(destination: WelcomeScreen()) {
                    Text("Play Again")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding()
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                        )
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius: 10)
                        .padding(.top, 20)
                        .scaleEffect(1.1) // Subtle scale on hover
                }

                Spacer()
            }
        }
        .onAppear {
            // Trigger the confetti animation after a brief delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    showConfetti = true
                }
            }
        }
    }
}

// Custom Confetti View (This is a mock, you can add a real confetti effect using libraries)
struct ConfettiView: View {
    var body: some View {
        ZStack {
            ForEach(0..<100) { _ in
                Circle()
                    .frame(width: CGFloat.random(in: 5...10), height: CGFloat.random(in: 5...10))
                    .foregroundColor(Color.white.opacity(0.8))
                    .position(
                        x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                        y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                    )
                    .animation(Animation.linear(duration: Double.random(in: 1...3)).repeatForever(autoreverses: false), value: UUID()) // Updated animation usage
            }
        }
    }
}

#Preview {
    WinningScreen(winnings: 1000000) // Example: Displaying a winning amount of $1,000,000
}
