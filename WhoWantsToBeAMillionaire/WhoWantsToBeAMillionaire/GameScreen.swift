//
//  GameScreen.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Bibhu Basnet on 12/4/24.
//

import SwiftUI

struct GameScreen: View {
    @State private var currentQuestionIndex = 0
    @State private var currentWinnings = 0 // Start from $0
    @State private var showToast = false
    @State private var toastMessage = ""
    @State private var isGameOver = false
    @State private var isGameWon = false
    
    // Sample questions, with the correct answer index (zero-based)
    let questions = [
        ("What is the capital of France?", ["Berlin", "Madrid", "Paris", "Rome"], 2),
        ("Which planet is known as the Red Planet?", ["Earth", "Mars", "Jupiter", "Venus"], 1),
        ("What is the largest mammal in the world?", ["Elephant", "Blue Whale", "Giraffe", "Hippopotamus"], 1),
        ("Who wrote 'Romeo and Juliet'?", ["Charles Dickens", "Mark Twain", "William Shakespeare", "Jane Austen"], 2),
        ("What is the square root of 64?", ["6", "7", "8", "9"], 2),
        ("What is the chemical symbol for water?", ["O2", "H2O", "CO2", "HO"], 1),
        ("How many continents are there?", ["5", "6", "7", "8"], 2),
        ("What year did the Titanic sink?", ["1910", "1912", "1914", "1920"], 1),
        ("What is the capital city of Australia?", ["Sydney", "Melbourne", "Canberra", "Brisbane"], 2),
        ("Which gas do plants absorb from the atmosphere?", ["Nitrogen", "Oxygen", "Carbon Dioxide", "Hydrogen"], 2)
    ]
    
    // Array representing the prize money for each question
    let prizeMoney = [500, 1000, 3500, 10000, 20000, 50000, 115000, 200000, 250000, 350000]
    
    var body: some View {
        ZStack {
            // Background gradient for the question screen
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.indigo]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            if isGameOver {
                GameOverScreen(winnings: currentWinnings)
            } else if isGameWon {
                WinningScreen(winnings: currentWinnings)
            } else {
                VStack {
                    Text("Current Winnings: $\(currentWinnings)")
                        .font(.title)
                        .foregroundColor(Color.green)
                        .padding()
                    
                    Text("Question \(currentQuestionIndex + 1)")
                        .font(.title2)
                        .foregroundColor(Color.white)
                        .padding(.bottom)
                    
                    Text(questions[currentQuestionIndex].0)
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(Color.yellow)
                        .padding(.bottom, 17.0)
                    
                    ForEach(0..<4, id: \.self) { index in
                        Button(action: {
                            checkAnswer(index: index)
                        }) {
                            Text(questions[currentQuestionIndex].1[index])
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.yellow.opacity(0.2))
                                .cornerRadius(8)
                                .padding(.horizontal)
                        }
                    }
                }
                .toast(isShowing: $showToast, text: Text(toastMessage))
            }
        }
    }
        func checkAnswer(index: Int) {
            let correctAnswer = questions[currentQuestionIndex].2
            if index == correctAnswer {
                // Add prize money to the current winnings after each correct answer
                currentWinnings += prizeMoney[currentQuestionIndex]
                
                toastMessage = "Correct! You have won $\(currentWinnings)"
                showToast = true
                
                if currentQuestionIndex == questions.count - 1 {
                    isGameWon = true
                } else {
                    currentQuestionIndex += 1
                }
            } else {
                toastMessage = "Wrong! The correct answer is \(questions[currentQuestionIndex].1[correctAnswer])"
                showToast = true
                isGameOver = true
            }
        }
    }
    


#Preview {
    GameScreen()
}
