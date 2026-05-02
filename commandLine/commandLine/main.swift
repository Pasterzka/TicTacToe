//
//  main.swift
//  commandLine
//
//  Created by Jakub Pastuszka on 02/05/2026.
//

import Foundation


var board: [String] = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
var isGameOn: Bool = true
var currentPlayer: String = "X"
var correctMove: Bool = false


// print board 3x3
func printBoard() -> Void{
    print("Now Playing: \(currentPlayer)")
    print("")
    
    print("  0|  1|  2")
    print(" " + board[0] + " | " + board[1] + " | " + board[2])
    print("   |   |")
    print("---+---+---")
    print("  3|  4|  5")
    print(" " + board[3] + " | " + board[4] + " | " + board[5])
    print("   |   |")
    print("---+---+---")
    print("  6|  7|  8")
    print(" " + board[6] + " | " + board[7] + " | " + board[8])
    print("   |   |")
}

func makeMove(player: String) -> Void {
    print("Enter the number of the position you want to place your \(currentPlayer)")
    
    // move logic
    while !correctMove{
        if let input = readLine(), let position = Int(input), position >= 0, position <= 8 {
            if board[position] == " " {
                board[position] = currentPlayer
                correctMove = true
            } else {
                print("That spot is already taken, try again")
                correctMove = false
            }
        } else {
            print("That's not a valid number, try again")
            correctMove = false
        }
    }
    correctMove = false
}

func checkWinner(player: String) -> Bool {
    // horizontally
    for i in 0...2{
        if board[i*3] == player && board[i*3+1] == player && board[i*3+2] == player{
            return true
        }
    }
    
    // vertically
    for i in 0...2{
        if board[i] == player && board[i+3] == player && board[i+6] == player{
            return true
        }
    }
    
    // slant 1
    if board[0] == player && board[4] == player && board[8] == player{
        return true
    }
    
    // slant 2
    if board[6] == player && board[4] == player && board[2] == player{
        return true
    }
    
    return false
}


// program
while isGameOn {
    printBoard()
    makeMove(player: currentPlayer)
    isGameOn = !checkWinner(player: currentPlayer)
    
    if !isGameOn{
        print("Player \(currentPlayer) won!")
        print("Game Ended")
    }
    
    if currentPlayer == "X"{
        currentPlayer = "O"
    }else{
        currentPlayer = "X"
    }
}

