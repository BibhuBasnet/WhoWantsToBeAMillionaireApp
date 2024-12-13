//
//  GameOverScreen.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Bibhu Basnet on 12/4/24.
//
import SwiftUI

struct GameOverScreen: View {
    var winnings: Int
    
    var body: some View {
        ZStack {
            // Background gradient for the question screen
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.indigo]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                Text("Game Over")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .padding()
                
                Text("You won $\(winnings)")
                    .font(.title)
                    .foregroundColor(Color.green)
                    .padding()
                
                NavigationLink(destination: WelcomeScreen()) {
                    Text("Play Again")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
            }
            .navigationBarBackButtonHidden(true) // Hide the back button
        }
    }
}

#Preview {
    GameOverScreen(winnings: 500)
}
