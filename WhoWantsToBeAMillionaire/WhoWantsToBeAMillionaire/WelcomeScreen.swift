//
//  WelcomeScreen.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Bibhu Basnet on 12/4/24.
//

import SwiftUI

struct WelcomeScreen: View {
    @State private var isGameActive = false // Track if the game is active
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Set the background color to purple
                Color.indigo
                    .opacity(1.0)
                    .edgesIgnoringSafeArea(.all)
                    
                VStack {
                    
                    Text("WHO WANTS TO BE A MILLIONAIRE?")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    // Background Image
                    Image("Millionaire")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    
                    // Use NavigationLink with the new method
                    NavigationLink(destination: GameScreen()) {
                        Text("START GAME")
                            .font(.title)
                            .fontWeight(.heavy)
                            .padding()
                            .background(Color("AccentColor"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.top, 20)
                }
            }
        }
    }
}

#Preview {
    WelcomeScreen()
}
