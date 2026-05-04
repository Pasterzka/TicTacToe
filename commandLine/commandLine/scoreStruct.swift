//
//  scoreStruct.swift
//  
//
//  Created by Jakub Pastuszka on 04/05/2026.
//

class scoreStruct {
    var scoreX = 0
    var scoreO = 0
    var draws = 0
    
    func resetScores() {
        scoreX = 0
        scoreO = 0
        draws = 0
    }
    
    func printScores() {
        print(" --- SCORE --- ")
        print("X: \(scoreX), O: \(scoreO), Draws: \(draws)")
    }
}
